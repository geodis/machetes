output "connect_info" {
  value = aws_instance.example.public_ip

}

output "rds" {
  value = aws_db_instance.mariadb.endpoint
}