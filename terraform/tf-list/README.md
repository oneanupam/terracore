# Terraform List

This sub-project contains terraform code to understand the concept of `querying the resources using list in terraform`.

- Terraform list resources let you query existing remote objects for a given managed resource type and return them to the CLI without planning or applying changes to .tf configuration. They are implemented in the provider alongside ordinary resources and reuse the same resource type name, schema, and identity definitions. Means, The list block defines a query that reads existing infrastructure and returns resources to import to your Terraform workspace.
- List resources are read-only queries. They do not create, update, or delete infrastructure.

## Prerequisites

All the prerequisites mentioned in top level README file must be fulfilled for successful execution of code.

## List Block Configuration and Execution

- list blocks live only in files whose names end with .tfquery.hcl.
- Terraform loads \*.tfquery.hcl when you run terraform query from that directory.
- You can also add the locals block to your query file to define temporary variables scoped to the query configuration. Similarly you can also add the variables and provider block in the query file. Make sure to use the unique variable name within a module.
- Run the `terraform query` command to retrieve the resource types specified in your list blocks in CLI output. To generate configuration, run the terraform query command and add the -generate-config-out flag. The flag expects a path to a generated file named generated.tf. The generated.tf file contains the resource and import blocks, including resource identities, necessary for importing results.
- In the end, Copy the import and resource blocks from the generated.tf file to your main.tf configuration and run the terraform apply command to import the resources.

```bash
terraform query # to get the output in simple format
terraform query -json # to get the output in json format
terraform query -generate-config-out=generated.tf
or
terraform query -generate-config-out=import/generated.tf
```

## TF Code Execution

To execute the terraform code, go to command prompt and then run the following commands:

- [Required] `terraform init` # To initialize the terraform working directory.
- [Optional] `terraform query` # To list the output in simple format.

## References

- https://developer.hashicorp.com/terraform/language/block/tfquery/list
- https://developer.hashicorp.com/terraform/cli/commands/query
- https://developer.hashicorp.com/terraform/language/import/bulk
