output "ansible_inventory" {
  value = <<-EOF
    [webservers]
    %{for ip in aws_instance.Ubuntu_Instance.*.public_ip~} >> "/etc/ansible/hosts"
    ${ip}
    %{endfor~}
  EOF
}

/*# Output the key pair ID based on whether it was created
output "key_pair_id" {
  value = length(aws_key_pair.new_key_pair) > 0 ? aws_key_pair.new_key_pair.id : var.key_name
}*/

output "lambda_function_arn" {
  value = aws_lambda_function.example_lambda.arn
}
