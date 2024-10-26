resource "aws_s3_bucket" "BucketCreate" {
  bucket = "kesava-tf-log-bucket"  
tags = {
    name = "kesava"
    environment = "Prod"
    target_prefix = "log/"
  }
    versioning {
        enabled = true
    }
}