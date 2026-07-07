// Ephemeral resource block to for random password generation. The primary use-case for generating an
// ephemeral random password is to be used in combination with a write-only argument in a managed resource.
// https://registry.terraform.io/providers/hashicorp/random/latest/docs/ephemeral-resources/password

ephemeral "random_password" "tst_vm_password" {
  length           = 16
  special          = true
  override_special = var.override_special_characters
}

// Resource block to create a secret in Google Secret Manager
resource "google_secret_manager_secret" "tst_vm_secret" {
  project = var.project_id

  secret_id           = "tst-vm-password"
  version_destroy_ttl = "86400s" # Version destroy TTL must be at least [24h]

  replication {
    user_managed {
      replicas {
        location = "us-central1"
      }
    }
  }
}

// Resource block to create a secret version in Google Secret Manager
resource "google_secret_manager_secret_version" "tst_vm_secret_version_write_only" {
  secret = google_secret_manager_secret.tst_vm_secret.id

  secret_data_wo         = ephemeral.random_password.tst_vm_password.result
  secret_data_wo_version = var.revision # To trigger an update of a write-only argument, increment the version argument's value in your configuration as Terraform will notice that change in its plan.
}
