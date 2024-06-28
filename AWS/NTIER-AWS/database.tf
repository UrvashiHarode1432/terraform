data "aws_subnets" "db" {
  filter {
    name   = "tag:Name"
    values = var.db_subnet_names
  }
  depends_on = [aws_subnet.subnets]
}

resource "aws_db_subnet_group" "ntier_subnet_group" {
  name       = "ntier_subnet_group"
  subnet_ids = data.aws_subnets.db.ids
  #   subnet_ids = [aws_subnet.subnets[4].id, aws_subnet.subnets[5].id]
  tags = {
    Name = "ntier_subnet_group"
  }
  depends_on = [aws_subnet.subnets, data.aws_subnets.db]
}

resource "aws_db_instance" "ntier_db" {
  allocated_storage      = 10
  db_name                = "emp"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = "root"
  password               = "rootroot"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.ntier_subnet_group.name
  identifier             = "emp-rds"
  vpc_security_group_ids = [aws_security_group.dbsg.id]

  depends_on = [aws_db_subnet_group.ntier_subnet_group, aws_vpc.ntier_vpc, aws_subnet.subnets]
}