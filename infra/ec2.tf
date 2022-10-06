
#ec2 intance

resource "aws_instance" "movie_app_server" {
  ami                    = data.aws_ami.amz_linux_image.id
  instance_type          = var.movie_app_ec2_type
  subnet_id              = data.aws_subnet.Public_3.id
  vpc_security_group_ids = [aws_security_group.movie_app_sg.id]
  key_name               = var.my_keypair
  user_data = "${file("${path.module}/user-data.sh")}"
  
  tags = {
    Name = " Movie-management-server"
  }
}