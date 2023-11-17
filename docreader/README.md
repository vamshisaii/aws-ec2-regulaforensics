# Docreader Infrastructure deployment (AWS Cloud)


## Prerequisites

This section describes how to use Terraform/Packer/Ansible to provision a Docreader.

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
- Edit packer variables file `packer/variables/docreader.pkrvars.hcl` according to your needs
- Required `docreader_tag` (default "latest") can be found at [hub.docker.com](https://hub.docker.com/r/regulaforensics/docreader/tags)
- Run packer build to create AWS ami

> [!NOTE]
> Execute command at `docreader/packer` folder

```bash
  packer build -var-file=variables/docreader.pkrvars.hcl docreader.pkr.hcl
```

### Configure Terraform

- Edit terraform variables at `terraform/main.tf`
- Upload certificate for your domain "*.example.com" using AWS Certificate Manager (ACM). (see `terraform/variables.tf` - `domain` var)

### Run Terraform templates

> [!NOTE]
> Execute commands at `docreader/terraform` folder

```bash
  terraform init
  terraform workspace new dev || teraform workspace select dev #(step is optional)
  terraform plan
  terraform apply
```
