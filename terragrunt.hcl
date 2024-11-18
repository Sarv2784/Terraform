remote_state {
  backend = "s3"
  config = {
    bucket         = "terraform-state-20241118"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
