terraform {
  backend "s3" {
    bucket         = "ta-terraform-tfstates-163065498600"
    key            = "projects/movie-management/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}