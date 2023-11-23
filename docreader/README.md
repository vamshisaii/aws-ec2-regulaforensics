# Docreader Infrastructure Deployment (AWS Cloud)

This section describes how to use Terraform/Packer/Ansible to provision a Docreader.

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

- Set a license file to the `packer/license/regula.license` folder.
- Edit the Packer variables file `packer/variables/docreader.pkrvars.hcl` according to your needs.
- Required `docreader_tag` (default "latest") can be found at [hub.docker.com](https://hub.docker.com/r/regulaforensics/docreader/tags).
- Run a Packer build to create AWS AMI.

> [!NOTE]
> Execute the command at the `docreader/packer` folder.

```bash
  packer build -var-file=variables/docreader.pkrvars.hcl docreader.pkr.hcl
```

### Configure Terraform

- Edit Terraform variables at `terraform/main.tf`.
- Upload a certificate for your domain "*.example.com" using AWS Certificate Manager (ACM). (See `terraform/variables.tf` - `domain` var.)

### Run Terraform templates

> [!NOTE]
> Execute commands at the `docreader/terraform` folder.

```bash
  terraform init
  terraform workspace new dev || A Terraform workspace, select dev # (optional).
  terraform plan
  terraform apply
```
