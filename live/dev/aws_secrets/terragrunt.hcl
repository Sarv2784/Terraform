include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/secrets_manager"
}

inputs = {
  aws_region       = "us-east-1"
  environment      = "dev"
  secret1_name     = get_env("TF_VAR_secret1_name")
  secret1_password = get_env("TF_VAR_secret1_password")
  secret2_key      = get_env("TF_VAR_secret2_key")
}