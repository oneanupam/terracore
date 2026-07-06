// Resource outputs
output "tst_vpc_subnet" {
  value       = google_compute_subnetwork.tst_vpc_subnet
  description = "The subnet resource being created"
}

output "tst_vpc_subnet_01_id" {
  description = "The ID of the first subnet being created."
  # Output value using the key of the map
  value = google_compute_subnetwork.tst_vpc_subnet["fdn-tst-subnet-01"].id
}

/*************************************************
  Output using for expression
*************************************************/
output "tst_vpc_subnet_ids" {
  description = "The IDs of the subnets being created."
  value = [
    # The map keys are ignored because we didn't declare a second iterator variable to iterate the map.
    # The below line is equivalent to -> for _, instance in google_compute_subnetwork.tst_vpc_subnet :
    for instance in google_compute_subnetwork.tst_vpc_subnet :
    instance.id
  ]
}

output "tst_vpc_subnet_ids_02" {
  description = "The IDs of the subnets being created."
  value = {
    for key, value in google_compute_subnetwork.tst_vpc_subnet :
    key => value.id
  }
}

output "tst_eip_ids" {
  description = "The IDs of the external IPs being reserved."
  value = [
    # Similiar concept as line 19
    for instance in google_compute_address.tst_eip :
    instance.id
  ]
}
