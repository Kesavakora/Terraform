/*# Create a new Key Pair
resource "aws_key_pair" "my_key" {
  key_name   = "my_key"                  # The key pair name
  public_key = file("~/.ssh/id_rsa.pub") # Path to your local public key file
}

variable "key_name" {}

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.example.public_key_openssh
}

resource "aws_key_pair" "tf-key-pair" {
  key_name   = "tf-key-pair"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "local_file" "tf-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tf-key-pair"
}*/

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Try to find an existing key pair
/*data "aws_key_pair" "existing" {
  key_name = var.key_name
  # This will attempt to read the key from AWS
}*/

# Conditionally create the key pair based on the variable
resource "aws_key_pair" "new_key_pair" {
  count    = var.create_key_pair ? 0 : 1
  key_name = var.key_name
  #public_key = file(var.public_key_path)
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "local_file" "tf-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "my-key-pair"
}
# Output the key pair ID based on whether it was created
output "key_pair_id" {
  value = length(aws_key_pair.new_key_pair) > 0 ? aws_key_pair.new_key_pair[0].id : var.key_name
}


