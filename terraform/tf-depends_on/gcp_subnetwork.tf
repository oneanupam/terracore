// Resource block to deploy subnetwork | Example of Implicit Dependency
resource "google_compute_subnetwork" "tst_vpc_subnet_01" {
  name                     = var.subnet_name[0]
  ip_cidr_range            = var.subnet_cidr[0]
  region                   = var.default_region
  private_ip_google_access = true
  network                  = google_compute_network.tst_vpc.id
}

// Resource block to deploy subnetwork | Example of Explicit Dependency
resource "google_compute_subnetwork" "tst_vpc_subnet_02" {
  name                     = var.subnet_name[1]
  ip_cidr_range            = var.subnet_cidr[1]
  region                   = var.default_region
  private_ip_google_access = true
  network                  = "projects/${var.project_id}/global/networks/${var.vpc_name}"

  depends_on = [
    google_compute_network.tst_vpc
  ]
}
