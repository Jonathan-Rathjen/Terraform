output "public_ipv4_addresses" {
    value = aws_instance.main[*].public_ip
}