# data "template_file" "user_data" {
#   template = file("./scripts/frontend.sh")

#   vars = {
#     rds_endpoint = aws_db_instance.ecomm-db-inst.endpoint
#   }
# }
