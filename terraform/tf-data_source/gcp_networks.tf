/*
Prerequisites:
1. Resource must exist in order to fetch a particular attribute. Hence, Create a VPC manually to test this example.
2. Check the provider documentation to know what attributes of a resource can be fetched.
*/

// Data block to get the attributes of existing vpc
data "google_compute_network" "tst_vpc" {
  project = var.project_id
  name    = var.vpc_name
}

// Resource block to deploy Subnetwork
resource "google_compute_subnetwork" "tst_vpc_subnet" {
  name                     = var.subnet_name
  ip_cidr_range            = var.subnet_cidr
  region                   = var.default_region
  private_ip_google_access = true
  network                  = data.google_compute_network.tst_vpc.id
}
