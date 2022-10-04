resource "aws_security_group" "movie_app_sg" {
  name        = "movie-app-sg"
  description = "SG for movie managt Application"
  vpc_id      = data.aws_vpc.main.id

  # INBOUND CONNECTIONS
  ingress {
    description = "Access to our Flask app"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound CONNECTIONS
  egress {
    description = "Allow access to the world"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #Both TCP + UDP any protocol(we don't care)
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "movie-app-sg"
  }
}