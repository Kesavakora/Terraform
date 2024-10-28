variable "key_name" {
  description = "The name of the key pair to use or create"
  type        = string
  default     = "my-key-pair"  # Replace with your key pair name
}

variable "public_key_path" {
  description = "The path to the public key file (required only if creating a new key pair)"
  type        = string
  default     = "id_rsa.pub"
}

variable "create_key_pair" {
  description = "Whether to create a new key pair if it doesn't already exist"
  type        = bool
  default     = false
}
