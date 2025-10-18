output "rds_endpoint" {
  value       = aws_db_instance.ecomm-db-inst.endpoint
  description = "The endpoint of the RDS instance"
}

output "lb_dns" {
  value       = aws_lb.ecomm-alb-fe.dns_name
  description = "The DNS name of the Load Balancer"
}