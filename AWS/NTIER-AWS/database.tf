data "aws_subnets" "db" {
  filter {
    name   = "tag:Name"
    values = var.db_subnet_names
  }
  depends_on = [aws_subnet.subnets]
}

resource "aws_db_subnet_group" "ntier_db" {
  name       = "ntier_db"
  subnet_ids = data.aws_subnets.db.ids
  #   subnet_ids = [aws_subnet.subnets[4].id, aws_subnet.subnets[5].id]
  tags = {
    Name = "ntier_db"
  }
  depends_on = [aws_subnet.subnets, data.aws_subnets.db]
}

# resource "aws_db_instance" "ntierdb" {

# }