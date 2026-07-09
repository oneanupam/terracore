# Terraform Backend

This sub-project contains terraform code to understand the concept of `backends in terraform`.

- Terraform uses persisted state data to keep track of the resources it manages. You can either integrate with HCP Terraform to store state data or define a backend block to store state in a remote object. This lets multiple people access the state data and work together on that collection of infrastructure resources.
- Terraform uses a backend called local by default. The local backend type stores state as a local file on disk.
- GCS backend stores the state as an object in a configurable prefix in a pre-existing cloud storage bucket on Google Cloud Platform. Hence, the bucket must exist prior to configuring the backend. GCS backend supports state locking which helps preventing conflicts and inconsistencies.
- It is highly recommended that you enable Object Versioning on the GCS bucket to allow for state recovery in the case of accidental deletions and human error.
- Before migrating to a new backend, it is strongly recommended to manually backing up your state by copying your terraform.tfstate file to another location.

## Prerequisites

All the prerequisites mentioned in top level README file must be fulfilled for successful execution of code.

## Backend Configuration

- To configure a backend, add a nested backend block within the top-level terraform block. The arguments in the backend block body are specific to the backend type.
- We can omit some or all of the arguments (known as partial configuration) while defining backend configuration. With a partial configuration, the remaining configuration arguments must be provided as part of the initialization process.

```bash
terraform init -backend-config=PATH
terraform init -backend-config="config.gcs.tfbackend"
```

## TF Code Execution

To execute the terraform code, go to command prompt and then run the following commands:

- [Required] `terraform init` # To initialize the terraform working directory.
- [Optional] `terraform validate` # To validate the terraform configuration.
- [Optional] `terraform fmt` # To format the terraform configuration to a canonical format and style.
- [Optional] `terraform plan` # To create an execution plan for terraform configuration files.
- [Required] `terraform apply -auto-approve` # To execute the actions proposed in a terraform plan to create, update, or destroy infrastructure.
- [Optional] `terraform destroy -auto-approve` # To destroy the created infrastructure. Specific resources can be destroyed using resource targetting.

## References

- https://developer.hashicorp.com/terraform/cli/import
- https://developer.hashicorp.com/terraform/cli/import/usage
