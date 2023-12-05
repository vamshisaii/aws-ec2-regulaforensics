# FaceAPI Infrastructure Deployment (AWS Cloud)

This section describes how to use Terraform/Packer/Ansible to provision a FaceAPI.

Terraform is an Infrastructure as Code (IaC) software tool. With Terraform, you can provision infrastructure by using declarative configuration files.

## Prerequisites

- Install and configure [Terraform](https://www.terraform.io/downloads.html).

- Install and configure [Packer](https://developer.hashicorp.com/packer/downloads).

- Install and configure [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html).

- Install and configure [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).

### Configure AWS CLI

- Set AWS CLI credentials:
```bash
  aws configure
```

### Configure Packer

- Set a license file to the `packer/artifacts/license/regula.license` folder.
- Edit the Packer variables file `packer/variables/faceapi.pkrvars.hcl` according to your needs.
- Required `faceapi_tag` (default "5.2.256.842") can be found at [hub.docker.com](https://hub.docker.com/r/regulaforensics/face-api/tags).
- `faceapi_engine` is either cpu(default) or gpu. This is important for the next Terraform section.
- Run a Packer build to create AWS AMI.

> [!NOTE]
> Execute the command at the `faceapi/packer` folder.

```bash
  packer build -var-file=variables/faceapi.pkrvars.hcl faceapi.pkr.hcl
```

### Configure Terraform

- Edit Terraform variables at `terraform/main.tf`.
- Upload a certificate for your domain "*.example.com" using AWS Certificate Manager (ACM). (See `terraform/variables.tf` - `domain` var.)

### Run Terraform templates

> [!NOTE]
> Execute commands at the `faceapi/terraform` folder.

> [!IMPORTANT]
> The default engine is CPU. To deploy a GPU version, do the following:
>   - Set `faceapi_engine` to `gpu` and `faceapi_instance_type` to one of the [`g4dn`](https://aws.amazon.com/ec2/instance-types/g4/) instance types, i.e. `g4dn.large` at the `terraform/main.tf` file.
>   - The Packer image also should have `faceapi_engine` set to `gpu`.

```bash
  terraform init
  terraform workspace new dev || terraform workspace select dev # (optional).
  terraform plan
  terraform apply
```
