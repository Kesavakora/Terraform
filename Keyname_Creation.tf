/*# Create a new Key Pair
resource "aws_key_pair" "my_key" {
  key_name   = "my_key"                  # The key pair name
  public_key = file("~/.ssh/id_rsa.pub") # Path to your local public key file
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
resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "local_file" "tf-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = var.key_name
}



