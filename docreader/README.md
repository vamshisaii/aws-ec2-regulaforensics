# Docreader Infrastructure deployment (AWS Cloud)


## Prerequisites

**AWS Account**

- Configure AWS credentials
```bash
  aws configure
```

**Packer**

- Set license file to `packer/license/regula.license`
- Set `env`/`region` to packer variables file `packer/variables/docreader.pkrvars.hcl`
- Pick required `docreader_tag` vars [hub.docker.com](https://hub.docker.com/r/regulaforensics/docreader/tags)
- Run packer build, i.e.:
```bash
packer build -var-file=variables/docreader.pkrvars.hcl -var docreader_tag=6.9.243116.738 docreader.pkr.hcl
```

**Terraform**

Deploy:
- Configure variables at `terraform/main.tf`
- Upload certificate for your domain "*.example.com" using AWS Certificate Manager (ACM). (euqals to `terraform/variables.tf` - `domain` var)
- `terraform init`
- `terraform workspace new ${env}` (optional)
- `terraform plan`
- `terraform apply`
