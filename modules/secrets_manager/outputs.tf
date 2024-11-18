output "secret1_details" {
  description = "Details of Secret 1"
  value = {
    name = aws_secretsmanager_secret.secret1.name
    arn  = aws_secretsmanager_secret.secret1.arn
  }
  sensitive = true
}

output "secret2_details" {
  description = "Details of Secret 2"
  value = {
    name = aws_secretsmanager_secret.secret2.name
    arn  = aws_secretsmanager_secret.secret2.arn
  }
  sensitive = true
}

output "all_secrets" {
  description = "Details of all secrets"
  value = {
    secret1 = {
      name = aws_secretsmanager_secret.secret1.name
      arn  = aws_secretsmanager_secret.secret1.arn
    }
    secret2 = {
      name = aws_secretsmanager_secret.secret2.name
      arn  = aws_secretsmanager_secret.secret2.arn
    }
  }
  sensitive = true
}
