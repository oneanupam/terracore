# locals block to define local variables for the VPC network configuration
locals {
  env = "tst"
  vpc = {
    tst = {
      project_id       = "extended-ward-500913-i6"
      derived_vpc_name = "${var.business_unit}-${var.environment}-${var.vpc_name}"
    }
    bld = {
      project_id       = "secret-rope-500913-q7"
      derived_vpc_name = "${var.business_unit}-${var.environment}-${var.vpc_name}"
    }
  }
}

// Resource block to deploy vpc network
resource "google_compute_network" "tst_vpc" {
  project                                   = local.vpc.tst.project_id
  name                                      = local.vpc.tst.derived_vpc_name
  description                               = "${var.vpc_description} for ${var.environment} environment"
  routing_mode                              = "GLOBAL" # use variable, if parameter will change between deployments.
  auto_create_subnetworks                   = var.auto_create_subnetworks
  delete_default_routes_on_create           = var.delete_default_routes
  network_firewall_policy_enforcement_order = var.network_firewall_policy_enforcement_order
}
