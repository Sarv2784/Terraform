terraform {
  backend "s3" {}
}

provider "aws" {
  region = var.aws_region
}

resource "aws_secretsmanager_secret" "secret1" {
  name        = "testing1/secret1"
  description = "Secret 1 managed by Terraform"
  tags = {
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "secret1_version" {
  secret_id = aws_secretsmanager_secret.secret1.id
  secret_string = jsonencode({
    name     = var.secret1_name
    password = var.secret1_password
  })
}

resource "aws_secretsmanager_secret" "secret2" {
  name        = "testing2/secret2"
  description = "Secret 2 managed by Terraform"
  tags = {
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "secret2_version" {
  secret_id = aws_secretsmanager_secret.secret2.id
  secret_string = jsonencode({
    key = var.secret2_key
  })
}
