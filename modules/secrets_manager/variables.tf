
variable "aws_region" {
  description = "AWS Region where the resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment tag for the resources"
  type        = string
  default     = "dev"
}

variable "secret1_name" {
  description = "The name for secret 1"
  type        = string
}

variable "secret1_password" {
  description = "The password for secret 1"
  type        = string
  sensitive   = true
}

variable "secret2_key" {
  description = "The key for secret 2"
  type        = string
  sensitive   = true
}
