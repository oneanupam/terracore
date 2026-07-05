# Terraform Concept Codes

This repository contains terraform concept code sets for learning and testing different terraform concepts.

## Prerequisites

Below prerequisites must be fulfilled for successful execution of terraform concept code sets.

### Software Requirement

Resources in this repository are meant to use with Terraform 1.14.0 (check the terraform version using: `terraform version`). If you don't have the compatible version, download it from official Terraform repository.

- [Cloud SDK](https://cloud.google.com/sdk/install) >= 414.0.0
- [Terraform](https://www.terraform.io/downloads.html) >= 1.14.0

> [!NOTE]
> See [Installation-Guide](https://gist.github.com/anupam-sy/7458df6506e8e3cfb28c0ff56fab546a) on how to install Terraform.

### Permissions Requirement

**Option-01:** If you are using terraform on your workstation, It is recommended that you authenticate using User Application Default Credentials ("ADCs") as a primary authentication method. You can enable ADCs by running the command.

```
    gcloud auth application-default login
```

**Option-02:** You can create a Service Account and reference service account key file in providers configuration block.

<details>
```python
    provider "google" {
        credentials = file("./credentials/service_account_key.json")
    }
```
</details>

Whatever option you choose, make sure to provide the following roles to selected principle (User/ServiceAccount).

- `roles/resourcemanager.projectOwner` on all the projects where you want to house your resources using service account's email.
- `roles/storage.admin` on the GCS bucket housing terraform state files. This role is required in case of using GCS backend.

> [!NOTE]
> Access can be more fine-grained to follow the principle of least privilege (PoLP).
> You can explore the other authentication options by reviewing the references and use the best suited for your usecase.

### Project Requirement

It is required to create a Project on Google Cloud Platform to test and deploy the services. In order to use the google cloud services in a GCP Project, respective service API(s) must be enabled before resource deployment. You can either enable these using terraform or using gcloud command. Sample examples are mentioned below -

**✓** Use terraform code snip to enable google cloud service APIs

```
    // Locals block to define required service APIs.
    locals {
    googleapis = [
        "compute.googleapis.com",
        "cloudresourcemanager.googleapis.com",
        "iam.googleapis.com"
        ]
    }
    // Resource block to enable required service APIs
    resource "google_project_service" "apis" {
    for_each = toset(local.googleapis)

    project                = "[UPDATE_PROJECT_ID]"
    service                = each.key
    disable_on_destroy     = false
    }
```

**✓** Use gcloud command to enable google cloud service APIs

```
gcloud services enable servicenetworking.googleapis.com \
    cloudresourcemanager.googleapis.com \
    compute.googleapis.com \
    iam.googleapis.com
```

### Remote Backend Setup

For local backend, terraform state file is stored locally in the current working directory. To use a remote backend (to enable the collaboration of other team members), create a google cloud storage bucket in a GCP project and enable the versioning. Use below gcloud commands to created and set up gcs backend bucket.

```
    gcloud config set project PROJECT_ID
    gsutil mb -c standard -l eu gs://bucket-name
    gsutil versioning set on gs://bucket-name
```

## TF Code Execution

To execute the Terraform code, go to command prompt and then run the following commands:

- [Required] `terraform init` # To initialize the terraform working directory.
- [Optional] `terraform validate` # To validate the terraform configuration.
- [Optional] `terraform fmt` # To format the terraform configuration to a canonical format and style.
- [Optional] `terraform plan` # To create an execution plan for terraform configuration files.
- [Required] `terraform apply -auto-approve` # To execute the actions proposed in a terraform plan to create, update, or destroy infrastructure.
- [Optional] `terraform destroy -auto-approve` # To destroy the created infrastructure. Specific resources can be destroyed using resource targeting.

> [!CAUTION]
> `terraform destroy -auto-approve` is destructuve in nature, kindly ensure to double check before using this command for any live environment.

> [!CAUTION]
> Run `terraform destroy` command with caution as it can destroy all the deployed infrastructure.

To execute the Terraform code using justfile, go to command prompt at the repo root and then run the following commands:

> just --justfile justfile --working-directory terraform/tf-basic_skeleton --dry-run init # for dry run
> just --justfile justfile --working-directory terraform/tf-basic_skeleton init # for actual run

## References

- https://www.terraform.io/cli
- https://github.com/casey/just
- https://www.terraform.io/language
- https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference
