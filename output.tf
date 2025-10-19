output "rds_endpoint" {
  value       = aws_db_instance.ecomm-db-inst.endpoint
  description = "The endpoint of the RDS instance"
}

output "lb_dns" {
  value       = aws_lb.ecomm-alb-fe.dns_name
  description = "The DNS name of the Load Balancer"
}

output "custom_dns" {
  value = aws_route53_record.ecomm-record.name
}

output "custom_dns_fqdn" {
  value = aws_route53_record.ecomm-record.fqdn
}

output "rds_address" {
  value       = aws_db_instance.ecomm-db-inst.address
  description = "The address of the RDS instance"
}

output "my_ip" {
  value = data.http.my_ip.response_body
}