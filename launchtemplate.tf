# Launch Template for frontend EC2 instances
resource "aws_launch_template" "ecomm-launch-temp-fe" {
  image_id      = data.aws_ami.amazon-linux-2023.image_id
  instance_type = "t2.micro"
  key_name      = "sing_01"
  user_data = base64encode(templatefile("${path.module}/scripts/frontend.sh", {
  db_endpoint = aws_db_instance.ecomm-db-inst.endpoint
}))


  # user_data     = base64encode(file("./scripts/frontend.sh"))

  #   <<EOF
  # #!/bin/bash
  # sudo dnf update -y
  # sudo dnf install -y httpd
  # sudo systemctl start httpd
  # sudo systemctl enable httpd
  # mkdir project
  # sudo aws s3 cp s3://val-01 /home/ec2-user/project --recursive
  # cp -r /home/ec2-user/project/* /var/www/html/
  #   EOF

  #  file("./scripts/frontend.sh")

  iam_instance_profile {
    arn = aws_iam_instance_profile.ecomm-instance-profile.arn
  }

  network_interfaces {
    security_groups             = [aws_security_group.ecomm-sec-fe.id]
    associate_public_ip_address = true
  }

  tags = {
    Name = "ecomm-launch-temp-fe"
  }
}

# Launch Template for backend EC2 instances
resource "aws_launch_template" "ecomm-launch-temp-be" {
  image_id      = data.aws_ami.amazon-linux-2023.image_id
  instance_type = "t2.micro"
  key_name      = "sing_01"

  network_interfaces {
    security_groups             = [aws_security_group.ecomm-sec-be.id]
    associate_public_ip_address = false
  }

  tags = {
    Name = "ecomm-launch-temp-be"
  }
}

data "aws_ami" "amazon-linux-2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.9*-x86_64"]
  }

}