output "public_ip" {
  value = aws_eip.k8s_eip.public_ip
}