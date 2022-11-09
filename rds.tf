resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "wordpressdb"
  engine               = "mysql"
  engine_version       = "5.7"
  availability_zone    = "ap-south-1a"
  publicly_accessible  = false
  instance_class       = "db.t2.micro"
  username             = "wordpress"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  tags = {
    Name = "rds-database"
  }
}