// Resource block to deploy VPC Network
resource "google_compute_network" "tst_vpc_01" {
  project                         = var.project_id
  name                            = var.vpc_name_01
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = var.auto_create_subnetworks
  delete_default_routes_on_create = var.delete_default_routes

  lifecycle {
    # Change the name of the VPC network and notice the behavior creation and then deletion of the old VPC network.
    create_before_destroy = true
  }
}
