# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "google_service_account" "all_gsas_0" {
  provider                     = google.query
  account_id                   = "infra-prov-svc-acc"
  create_ignore_already_exists = null
  deletion_policy              = "DELETE"
  description                  = null
  disabled                     = false
  display_name                 = "infra-prov-svc-acc"
  project                      = "extended-ward-500913-i6"
  timeouts {
    create = null
  }
}

import {
  to       = google_service_account.all_gsas_0
  provider = google.query
  identity = {
    email   = "infra-prov-svc-acc@extended-ward-500913-i6.iam.gserviceaccount.com"
    project = "extended-ward-500913-i6"
  }
}

resource "google_service_account" "all_gsas_1" {
  provider                     = google.query
  account_id                   = "418135321390-compute"
  create_ignore_already_exists = null
  deletion_policy              = "DELETE"
  description                  = null
  disabled                     = false
  display_name                 = "Compute Engine default service account"
  project                      = "extended-ward-500913-i6"
  timeouts {
    create = null
  }
}

import {
  to       = google_service_account.all_gsas_1
  provider = google.query
  identity = {
    email   = "418135321390-compute@developer.gserviceaccount.com"
    project = "extended-ward-500913-i6"
  }
}


