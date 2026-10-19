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

# Retrieve a specific secret from your "github" Safe
data "idsec_secret" "demo_secret" {
  safe_name = "github"
  name      = "demo-secret-object" # Replace with the name of an actual account in your Safe
}

# Output the secret value to the pipeline logs to prove it was retrieved
output "retrieved_password" {
  value     = data.idsec_secret.demo_secret.value
  sensitive = true
}