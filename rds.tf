# Database Instance
resource "aws_db_instance" "ecomm-db-inst" {
  identifier             = "ecomm-db"
  allocated_storage      = 20
  engine                 = "mysql"
  instance_class         = "db.t3.micro"
  password               = "12345678"
  username               = "admin"
  db_subnet_group_name   = aws_db_subnet_group.ecomm-db-sub-grp.name
  vpc_security_group_ids = [aws_security_group.ecomm-sec-db.id]
  skip_final_snapshot    = true
  multi_az               = false

  tags = {
    Name = "ecomm-db"
  }
}
