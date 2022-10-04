# DEFINING ALL VARIABLES
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "public_subnet_3_name" {
  description = "The name of my public subnet 3"
  type        = string
}

variable "amzn_ami_name" {
  description = "The name of the ami"
  type        = string
}

variable "amzn_ami_owner" {
  description = "The owner id of the ami"
  type        = string
}

variable "movie_app_ec2_type" {
  description = "The type of EC2 instance for the movie app"
  type        = string
}

variable "my_keypair" {}