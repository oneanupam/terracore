# Terraform block to configure terraform and provider version
terraform {
  required_version = "~> 1.15.7"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.39.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 7.39.0"
    }
  }
}
