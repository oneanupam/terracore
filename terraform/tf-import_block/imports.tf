# All the import blocks for the existing GCP resources

/*
Steps to import an existing subnetwork resource:
1. Create a resource manually to import it.
2. Use the terraform import command to import the resource into your state file.
3. Run below command to generate terraform configuration for your manually created resource.
Note: Make sure to not supply a path to an existing file otherwise terraform will throw an error.
    terraform plan -generate-config-out=gcp_subnetwork.tf
4. Execute the `terraform apply` command to import your existing resources.
    terraform apply -auto-approve

Note:
1. The import block is idempotent, meaning that applying an import action and running another
plan will not generate another import action as long as that resource remains in your state.
2. If you want, you can remove import blocks after completing the import or safely leave them
in your configuration as a record of the resource's origin for future module maintainers.
*/

import {
  to = google_compute_subnetwork.tst_subnet
  id = "projects/extended-ward-500913-i6/regions/us-central1/subnetworks/subnet-01"
}
