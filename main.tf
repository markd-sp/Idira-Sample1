terraform {
  required_providers {
    idsec = {
      source  = "cyberark/idsec"
      version = ">= 0.5"
    }
  }
}

# The credentials to authenticate are passed in via the environment variables 
# we mapped in the GitHub Actions YAML
provider "idsec" {
  auth_method = "identity_service_user"
}

# Retrieve a specific account from your "Github" Safe
data "idsec_pcloud_account" "demo_account" {
  safe_name = "Github"
  name      = "client_id" 
}

# Output the account name to prove Terraform authenticated and found it
output "retrieved_account_name" {
  value = data.idsec_pcloud_account.demo_account.name
}