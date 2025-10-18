

# data "template_file" "frontend_script" {
#   template = file("./scripts/frontend.sh")

#   vars = {
#     MY_VAR = aws_db_instance.ecomm-db-inst.endpoint # Inject the value of the Terraform variable here
#   }
# }