terraform {
  required_providers {
    idsec = {
      source  = "cyberark/idsec"
      version = ">= 0.5"
    }
  }
}

provider "idsec" {
  auth_method = "identity_service_user"
}

resource "idsec_pcloud_safe" "demo_safe" {
  safe_name                = "TF-Demo-Safe-02"
  description              = "Created automatically by GitHub Actions"
  number_of_days_retention = 7
}

resource "idsec_pcloud_safe_member" "mark" {
  safe_id        = idsec_pcloud_safe.demo_safe.safe_id
  member_name    = "markd@mdt.cloud"
  member_type    = "User"
  permission_set = "full"
}