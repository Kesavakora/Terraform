/*resource "aws_s3_bucket" "mybucket" {
  bucket = "kesava-tf-bucket-1"  # Change to your unique bucket name
  #acl    = "private"  # Access control list; options include "private", "public-read", etc.

  tags = {
    Name        = "mybucket"
    Environment = "prod"
  }
  versioning {
    enabled = true
  }
} */ 

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "kesava-tf-bucket-1" # Replace with a globally unique bucket name

  tags = {
    Name = "My S3 Bucket"
  }
}

# Enable versioning on the S3 bucket
resource "aws_s3_bucket_versioning" "my_bucket_versioning" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

/*terraform {
  backend "s3" {
    profile = "Administ" # AWS CLI profile name
    encrypt = true
    bucket  = "kesava-tf-bucket-1"
    key     = "terraform.tfstate"
    region  = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }
}*/

# Output the bucket name
output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
