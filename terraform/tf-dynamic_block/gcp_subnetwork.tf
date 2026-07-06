// Resource block to deploy subnetwork 01
resource "google_compute_subnetwork" "tst_vpc_subnet_01" {
  name                     = var.subnet_name[0]
  ip_cidr_range            = var.subnet_cidr[0]
  region                   = var.default_region
  private_ip_google_access = true
  network                  = google_compute_network.tst_vpc.id

  secondary_ip_range {
    range_name    = "pod-range"
    ip_cidr_range = "10.0.50.0/24"
  }
  secondary_ip_range {
    range_name    = "svc-range"
    ip_cidr_range = "10.0.51.0/24"
  }
}

// Resource block to deploy subnetwork 02
resource "google_compute_subnetwork" "tst_vpc_subnet_02" {
  name                     = var.subnet_name[1]
  ip_cidr_range            = var.subnet_cidr[1]
  region                   = var.default_region
  private_ip_google_access = true
  network                  = google_compute_network.tst_vpc.id

  dynamic "secondary_ip_range" {
    for_each = var.subnet02_secranges
    iterator = each
    content {
      range_name    = each.value["name"]
      ip_cidr_range = each.value["cidr"]
    }
  }
}
