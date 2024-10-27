variable "key_name" {
  description = "The name of the key pair"
  type        = string
  default     = "tf-key-pair"
}

variable "public_key_path" {
  description = "The path to the public key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}