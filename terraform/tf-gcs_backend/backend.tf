/*
1. Create the GCS Bucket using Cloud SDK / Cloud Shell:
> gcloud auth login
> gcloud config set project PROJECT_ID
> gsutil mb -c standard -l eu gs://bkt-tfstates-xxxxxx

2. Set the Bucket versioning.
> gsutil versioning set on gs://bkt-tfstates-xxxxxx

3. Clean-up process
> gcloud storage rm --recursive gs://bkt-tfstates-xxxxxx
*/

// Configure Google Cloud Storage (GCS) Backend
terraform {
  backend "gcs" {
    # bucket      = "tfstates-bkt-050726"
    # prefix      = "tst/tf-gcs-backend"
  }
}
