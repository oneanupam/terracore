# Check block to validate the deployed infrastructure
check "tst_vpc_exists" {

  # Scoped data source for check block
  data "google_compute_network" "tst_vpc" {
    name = var.vpc_name
  }

  # It can have multiple assert blocks
  assert {
    condition     = data.google_compute_network.tst_vpc.self_link != ""
    error_message = "VPC was not created or self_link is missing"
  }

  assert {
    condition     = google_compute_network.tst_vpc.name == "fdn-tst-vpc-011" # Notice the warning in the console output
    error_message = "Deployed VPC name is not correct."
  }
}
