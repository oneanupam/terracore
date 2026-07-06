// Resource outputs
output "tst_vpc" {
  value       = google_compute_network.tst_vpc
  description = "The VPC resource being created"
}

output "tst_vpc_id" {
  value       = google_compute_network.tst_vpc.id
  description = "The ID of the VPC being created"
}

output "tst_vpc_name" {
  value       = google_compute_network.tst_vpc.name
  description = "The name of the VPC being created"
}

output "tst_password_value" {
  value       = random_password.tst_password.result
  description = "The generated value of the password"
  sensitive   = true
  precondition {
    condition     = length(random_password.tst_password.result) >= 16
    error_message = "Generated password must be of 16 digits or more."
  }
}
