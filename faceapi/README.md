# FaceAPI Infrastructure deployment (AWS Cloud)


## Prerequisites

This section describes how to use Terraform/Packer/Ansible to provision a FaceAPI.

Terraform is an infrastructure as code (IaC) software tool. With Terraform, you can provision infrastructure by using declarative configuration files.

- Install and configure [Terraform](https://www.terraform.io/downloads.html)

- Install and configure [Packer](https://developer.hashicorp.com/packer/downloads)

- Install and configure [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html)

- Install and configure [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

### Configure AWS CLI

- Set aws cli credentials
```bash
  aws configure
```

### Configure Packer

- Set license file to `packer/license/regula.license` folder
- Edit packer variables file `packer/variables/faceapi.pkrvars.hcl` according to your needs
- Required `faceapi_tag` (default "5.2.256.842") can be found at [hub.docker.com](https://hub.docker.com/r/regulaforensics/face-api/tags)
- `faceapi_engine` is either cpu(default) or gpu. This is important for the next Terraform section.
- Run packer build to create AWS ami

> [!NOTE]
> Execute command at `faceapi/packer` folder

```bash
  packer build -var-file=variables/faceapi.pkrvars.hcl faceapi.pkr.hcl
```

### Configure Terraform

- Edit terraform variables at `terraform/main.tf`
- Upload certificate for your domain "*.example.com" using AWS Certificate Manager (ACM). (see `terraform/variables.tf` - `domain` var)

### Run Terraform templates

> [!NOTE]
> Execute commands at `faceapi/terraform` folder

> [!IMPORTANT]
> Default enigne is CPU. In case you would like to deploy GPU version:
>   - set `faceapi_engine` to `gpu` and `faceapi_instance_type` to one of the [`g4dn`](https://aws.amazon.com/ec2/instance-types/g4/) instance types, i.e. `g4dn.large` at `terraform/main.tf` file
>   - Packer image also should have `faceapi_engine` set to `gpu`

```bash
  terraform init
  terraform workspace new dev || teraform workspace select dev #(step is optional)
  terraform plan
  terraform apply
```
