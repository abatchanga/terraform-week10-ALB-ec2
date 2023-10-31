terraform {
  backend "s3" {
    bucket         = "week10-achille-bucket"
    key            = "week10/terraform.tfstate"
    region         = "us-east-1" 
    dynamodb_table = "terraform-lock"
  }
}