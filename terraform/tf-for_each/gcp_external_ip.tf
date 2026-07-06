// Resource block to reserve regional external IP address
resource "google_compute_address" "tst_eip" {
  # for_each = toset(var.eip_names) # argument must be a map or a set of strings
  for_each = convert(var.eip_names, set(string)) # argument must be a map or a set of strings

  project      = var.project_id
  name         = each.value # each.key and each.value are the same for a set
  region       = var.default_region
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
}
