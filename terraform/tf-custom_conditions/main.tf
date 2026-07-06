// Resource block to generate a random password
resource "random_password" "tst_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*"
}

// Resource block to deploy vpc network
resource "google_compute_network" "tst_vpc" {
  project                         = var.project_id
  name                            = var.vpc_name
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = var.auto_create_subnetworks
  delete_default_routes_on_create = var.delete_default_routes

  lifecycle {
    precondition {
      condition     = var.auto_create_subnetworks == false
      error_message = "auto_create_subnetworks must be set to false for this VPC."
    }

    postcondition {
      condition     = self.id != "" # The self object can only be used in postcondition.
      error_message = "VPC network creation failed, ID is empty."
    }
  }
}
