# Variables
TF_PLAN_FILE ?= terraform.plan
TF_STATE_FILE ?= terraform.tfstate
TF_VAR_FILE ?= terraform.tfvars
TF_DIR ?= .
help:
	@echo "Available commands:"
	@echo "  make init          - Initialize Terraform (plugins, backend)"
	@echo "  make fmt           - Format Terraform configuration files"
	@echo "  make validate      - Validate Terraform files"
	@echo "  make lint          - Lint Terraform files with tflint"
	@echo "  make plan          - Create an execution plan"
	@echo "  make apply         - Apply the Terraform plan"
	@echo "  make destroy       - Destroy the Terraform-managed infrastructure"
	@echo "  make show          - Display the contents of the Terraform state"
	@echo "  make output        - Display outputs from the Terraform state"
	@echo "  make clean         - Remove temporary files (plan/state backups)"
	@echo "  make help          - Display this help message"

# Initialize Terraform
init:
	terraform -chdir=$(TF_DIR) init

# Format Terraform files
fmt:
	terraform -chdir=$(TF_DIR) fmt -recursive

# Validate Terraform configuration
validate: fmt
	terraform -chdir=$(TF_DIR) validate

# Lint Terraform files (requires tflint)
lint:
	@command -v tflint >/dev/null 2>&1 || { echo "tflint is not installed. Install it via 'brew install tflint'."; exit 1; }
	tflint $(TF_DIR)

# Create a Terraform plan
plan: validate
	terraform -chdir=$(TF_DIR) plan -var-file=$(TF_VAR_FILE) -out=$(TF_PLAN_FILE)

# Apply the Terraform plan
apply:
	terraform -chdir=$(TF_DIR) apply $(TF_PLAN_FILE)

# Destroy resources
destroy:
	terraform -chdir=$(TF_DIR) destroy -var-file=$(TF_VAR_FILE)

# Show Terraform state
show:
	terraform -chdir=$(TF_DIR) show $(TF_STATE_FILE)

# Display Terraform outputs
output:
	terraform -chdir=$(TF_DIR) output

# Clean temporary files
clean:
	rm -f $(TF_PLAN_FILE) $(TF_STATE_FILE).backup

deps:
	brew install tflint

.PHONY: deps init plan apply destroy fmt validate lint show output clean help