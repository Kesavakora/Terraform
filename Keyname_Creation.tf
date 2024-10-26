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
}*/

resource "aws_key_pair" "tf-key-pair" {
  key_name   = "tf-key-pair"
  public_key = var.keypair == true ?  tls_private_key.rsa.public_key_openssh :  0
 
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "tf-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tf-key-pair"
}



