# Locals block to hold and modify the values
locals {
  tf_sa = var.terraform_service_account
}

provider "google" {
  alias = "impersonated"
}

# Use ephemeral resource block rather data block.
# You can only reference ephemeral resources in specific ephemeral contexts otherwise, Terraform will throw an error.
ephemeral "google_service_account_access_token" "default" {
  provider               = google.impersonated
  target_service_account = local.tf_sa

  // To see, edit, configure, and delete your Google Cloud data
  scopes   = ["https://www.googleapis.com/auth/cloud-platform"]
  lifetime = "600s"
}

/******************************************
  GA Provider credential configuration
 *****************************************/

provider "google" {
  // configure the default project and region.
  project = var.project_id
  region  = var.default_region
  zone    = var.default_zone

  // A temporary OAuth 2.0 access token obtained from the Google Authorization server
  // used to authenticate HTTP requests to GCP APIs.
  access_token = ephemeral.google_service_account_access_token.default.access_token # This accepts ephemeral resource as reference.
}

/******************************************
  Beta Provider credential configuration
 *****************************************/

provider "google-beta" {
  // configure the default project and region.
  project = var.project_id
  region  = var.default_region
  zone    = var.default_zone

  // A temporary OAuth 2.0 access token obtained from the Google Authorization server
  // used to authenticate HTTP requests to GCP APIs.
  access_token = ephemeral.google_service_account_access_token.default.access_token
}
