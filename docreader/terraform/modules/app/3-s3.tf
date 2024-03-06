resource "random_uuid" "logs" {
  keepers = {
    image = data.aws_ami.docreader.id
  }
}

resource "random_uuid" "session" {
  keepers = {
    image = data.aws_ami.docreader.id
  }
}

module "s3_bucket_logs" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "docreader-logs-${random_uuid.logs.result}"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  force_destroy = true

  cors_rule = [{
    allowed_methods = ["GET", "HEAD", "PUT"]
    allowed_origins = ["*"]
  }]


  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

module "s3_bucket_session" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "docreader-session-${random_uuid.session.result}"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  force_destroy = true

  cors_rule = [{
    allowed_methods = ["GET", "HEAD", "PUT"]
    allowed_origins = ["*"]
  }]

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}
