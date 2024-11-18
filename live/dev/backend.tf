terraform {
  backend "s3" {
    bucket         = "terraform-state-20241118"
    key            = "dev/secrets_manager/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
