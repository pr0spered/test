resource "aws_sns_topic" "ecomm-updates" {
  name = "ecomm-updates"
}

resource "aws_sns_topic_subscription" "ecomm-email-subscription" {
  topic_arn = aws_sns_topic.ecomm-updates.arn
  protocol  = "email"
  endpoint  = "quantumwormholeguy@gmail.com"
}

# action "aws_sns_publish" "ecomm-notification" {
#   topic_arn = aws_sns_topic.ecomm-updates.arn
#   message   = "New EC2 instance has been created for E-Commerce Application"
# }


# data "external" "email_from_rds" {
#   program = ["python3", "email.py"]
# }

# resource "aws_sns_topic_subscription" "ecomm-email-subscription" {
#   topic_arn = aws_sns_topic.ecomm-updates.arn
#   protocol  = "email"
#   endpoint  = data.external.email_from_rds.result["email"]
# }
