terraform {
  backend "s3" {
    bucket         = "terraform-state-20241118"
    key            = "dev/secrets_manager/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  required_version = "v1.9.8"
}
