# Faceapi Infrastructure deployment (AWS Cloud)


## Prerequisites

**AWS Account**

- Configure AWS credentials
```bash
  aws configure
```

**Packer**

- Set license file to `packer/license/regula.license`
- Set `env`/`region` to packer variables file `packer/variables/face.pkrvars.hcl`
- Pick required `docreader_tag` vars [hub.docker.com](https://hub.docker.com/r/regulaforensics/face-api/tags)
- Run packer build, i.e.:
```bash
packer build -var-file=variables/faceapi.pkrvars.hcl -var faceapi_tag=5.2.256.842 faceapi.pkr.hcl
```

**Terraform**

Deploy:
- Configure variables at `terraform/main.tf`
- Upload certificate for your domain "*.example.com" using AWS Certificate Manager (ACM). (euqals to `terraform/variables.tf` - `domain` var)
- `terraform init`
- `terraform workspace new ${env}` (optional)
- `terraform plan`
- `terraform apply`

