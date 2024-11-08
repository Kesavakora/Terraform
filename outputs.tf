output "ansible_inventory" {
  value = <<-EOF
    [webservers]
    %{ for ip in aws_instance.Ubuntu_Instance.*.public_ip ~} >> "/etc/ansible/hosts"
    ${ip}
    %{ endfor ~}
  EOF
}