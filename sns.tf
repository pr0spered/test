resource "aws_sns_topic" "ecomm-updates" {
  name = aws_instance.ecomm-bastion.id
}

resource "aws_sns_topic_subscription" "ecomm-email-subscription" {
  topic_arn = aws_sns_topic.ecomm-updates.arn
  protocol  = "email"
  endpoint  = "quantumwormholeguy@gmail.com"
}
