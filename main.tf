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

# Create a brand new Safe to demonstrate Terraform in action
resource "idsec_pcloud_safe" "demo_safe" {
  safe_name   = "TF-Demo-Safe-01"
  description = "Created automatically by GitHub Actions"
  number_of_days_retention = 7
}