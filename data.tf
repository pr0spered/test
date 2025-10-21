data "http" "my_ip" {
  url = "https://ifconfig.me/ip"
}

data "aws_ami" "amazon-linux-2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.9*-x86_64"]
  }

}

data "aws_route53_zone" "ecomm-zone" {
  name         = "strawb3rry.club"
  private_zone = false
}