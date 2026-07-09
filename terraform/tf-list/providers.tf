// Provider block to configure Google GA and Google Beta providers
provider "google" {
  project = var.project_id
  region  = var.default_region
  zone    = var.default_zone
}

provider "google-beta" {
  project = var.project_id
  region  = var.default_region
  zone    = var.default_zone
}
