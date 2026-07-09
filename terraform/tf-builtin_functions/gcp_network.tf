/*************************************************
  Example of String Functions
*************************************************/

// Locals block to transform and construct values
locals {
  final_vpc_name = join("", ["fdn-", trimspace(var.vpc_name)])

  // Render the values to template file
  network_details = templatefile(
    "${path.module}/templates/network_details.tftpl",
    {
      vpc_id         = google_compute_network.tst_vpc.id
      vpc_self_link  = google_compute_network.tst_vpc.self_link
      vpc_project_id = var.project_id
    }
  )
}

// Resource block to deploy vpc network
resource "google_compute_network" "tst_vpc" {
  project                         = var.project_id
  name                            = local.final_vpc_name
  description                     = file("${path.module}/data/network_desc.txt")
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = var.auto_create_subnetworks
  delete_default_routes_on_create = var.delete_default_routes
}

// Save the deployed VPC details to a file
resource "local_file" "network_details" {
  filename = "${path.module}/generated/network_details.txt"
  content  = local.network_details
}
