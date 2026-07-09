// Provider block(s) for query file. Please note, The query file checks the main.tf configuration for provider configurations,
// but you can also declare one or more provider blocks in the query configuration file to define alternate provider configurations.
provider "google" {
  alias   = "query"
  project = var.project
}

# Variables for query file. Make sure to use the unique variable name within a module.
# You can also add the locals block to your query file to define temporary variables scoped to the query configuration.
variable "project" {
  type        = string
  description = "The ID of the google project to house the resources."
  default     = "extended-ward-500913-i6"
}

# gsa.tfquery.hcl to query all the service accounts
list "google_service_account" "all_gsas" {
  provider = google.query

  include_resource = true # By default, Terraform retrieves only resource identities, but you can set the include_resource argument to true so that Terraform can also retrieve all available resource attributes.
  limit            = 100  # By default, Terraform retrieves up to 100 resources per list block, but you can use the limit argument to specify a higher or lower number of results.

  config {
    # Optional. Defaults to the provider project when omitted.
    # The config block is mainly useful when you want to query a different project than the one configured in the provider.
    project = var.project
  }
}
