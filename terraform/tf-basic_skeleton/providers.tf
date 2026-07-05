// Provider block to configure Google GA and Google Beta providers
provider "google" {
  project = var.project_id
  region  = var.default_region
  zone    = var.default_zone
  # credentials = file("./credentials/tf_mgcp_svc_account.json")
}

provider "google-beta" {
  project = var.project_id
  region  = var.default_region
  zone    = var.default_zone
  # credentials = file("./credentials/tf_mgcp_svc_account.json")
}
