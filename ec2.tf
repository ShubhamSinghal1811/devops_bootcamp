resource "aws_instance" "web" {
  ami           = "ami-024c319d5d14b463e"
  instance_type = "t2.micro"
  key_name = "wordpress-key"
  subnet_id = aws_subnet.public[count.index].id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count = 2

  tags = {
    Name = "WebServer"
  }

#   provisioner "file" {
#     source = "./wordpress-key.pem"
#     destination = "/home/ec2-user/wordpress-key"
  
#     connection {
#       type = "ssh"
#       host = self.public_ip
#       user = "ec2-user"
#       private_key = "${file("./wordpress-key.pem")}"
#     }  
#   }
}

resource "aws_instance" "db" {
  ami           = "ami-024c319d5d14b463e"
  instance_type = "t2.micro"
  key_name = "wordpress-key"
  subnet_id = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]

  tags = {
    Name = "DB Server"
  }
}