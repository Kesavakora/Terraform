resource "aws_instance" "Ubuntu_Instance" {
  ami             = "ami-0522ab6e1ddcc7055"           # Amazon Linux 2 AMI
  instance_type   = "t2.micro"                        # Instance type
  key_name        = aws_key_pair.tf-key-pair.key_name # Associate the key pair with the EC2 instance
  security_groups = [aws_security_group.allow_ssh.name]
  count           = 2
  #provider = aws.Administ


  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo apt update -y
  sudo apt upgrade -y
  sudo install apache2
  echo "*** Completed Installing apache2"
  EOF

  provisioner "remote-exec" {
    inline = [
      "touch Hello.txt",
      "echo Hello worlds  >> Hello.txt"
    ]
  } 
  
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file(aws_key_pair.tf-key-pair.key_name)
    timeout     = "4m"
  }

  tags = {
    Name = "Kesava Instance"
  }
}

resource "null_resource" "copy-test-file" {

  connection {
    type     = "ssh"
    host     = aws_instance.Ubuntu_Instance[0].id
    user     = "ubuntu"
    private_key = file(aws_key_pair.tf-key-pair.key_name)
  }

    /*provisioner "file" {
    source = "/Users/kesavakora/Documents/Untitled 2.rtf"
    destination = "/usr/src/Untitled 2.rtf"
  }*/

}
resource "aws_ebs_encryption_by_default" "enabled" {
  enabled = true
 }