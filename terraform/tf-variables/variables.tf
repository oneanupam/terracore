// Variables declaration
variable "project_id" {} # bad practice

variable "default_region" {
  type        = string
  description = "The default region to create the google cloud regional resources."
}

variable "default_zone" {
  type        = string
  description = "The default zone to create the google cloud zonal resources."
}

variable "terraform_service_account" {
  type        = string
  description = "Terraform service account to execute the terraform code."
  # Make sure to give "roles/iam.serviceAccountTokenCreator" role to an identity (who will trigger the terraform code) on this service account for the impersonation to succeed.
}

variable "vpc_name" {
  description = "The name of the VPC network being created."
  type        = string
  default     = "my-vpc"
  validation {
    condition = (
      length(var.vpc_name) >= 1 && length(var.vpc_name) <= 62
    )
    error_message = "VPC name must be between 1 and 62 characters long."
  }
}

variable "description" {
  type        = string
  description = "The description of the VPC network being created."
  default     = "The foundation vpc network."
  nullable    = false # If nullable is false and the variable has a default value, then terraform uses the default even if the input value is null.
  deprecated  = true  # This variable is deprecated and will be removed in future versions. Use vpc_description instead.
}

variable "vpc_description" {
  type        = string
  description = "The description of the VPC network being created."
  default     = "The foundation vpc network."
  nullable    = false # If nullable is false and the variable has a default value, then terraform uses the default even if the input value is null.
}

variable "auto_create_subnetworks" {
  type        = bool
  description = <<EOT
  When set to true, the network is created in auto subnet mode and it will create a subnet
  for each region automatically across the 10.128.0.0/9 address range.
  https://developer.hashicorp.com/terraform/language/expressions/strings
  EOT
}

variable "delete_default_routes" {
  type        = bool
  description = "If set to true, default routes (0.0.0.0/0) will be deleted immediately after network creation."
  validation {
    condition = (
      var.delete_default_routes == true || var.delete_default_routes == false
    )
    error_message = "delete_default_routes must be either true or false."
  }
}

variable "network_firewall_policy_enforcement_order" {
  type        = string
  description = "Set the order that Firewall Rules and Firewall Policies are evaluated."
  default     = "AFTER_CLASSIC_FIREWALL"
}
