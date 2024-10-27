resource "aws_s3_bucket" "MyBucket" {
  bucket = "Kesava-TF-Bucket"  # Change to your unique bucket name
  #acl    = "private"  # Access control list; options include "private", "public-read", etc.

  tags = {
    Name        = "MyBucket"
    Environment = "Prod"
  }
  versioning {
    enabled = true
  }
}