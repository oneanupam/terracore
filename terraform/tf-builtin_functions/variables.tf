// Variables declaration
variable "project_id" {
  type        = string
  description = "The ID of the google project to house the resources."
  validation {
    condition     = length(var.project_id) >= 6 && length(var.project_id) <= 30
    error_message = "The project id value is incorrect."
  }
}

variable "default_region" {
  type        = string
  description = "The default region to create the google cloud regional resources."
  validation {
    condition     = contains(["us-central1", "us-east1"], var.default_region)
    error_message = "The given region is not correct as per requirements."
  }
}

variable "default_zone" {
  type        = string
  description = "The default zone to create the google cloud zonal resources."
}

variable "resource_labels" {
  description = "The labels to be associated with created resources."
  type        = map(string)
  default = {
    "env"     = "test"
    "buildby" = "anupam"
    "project" = "mgcp-foundation"
  }
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC network being created."
}

variable "vpc_description" {
  type        = string
  description = "The description of the VPC resource."
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in auto subnet mode and it will create a subnet for each region automatically across the 10.128.0.0/9 address range."
}

variable "delete_default_routes" {
  type        = bool
  description = "If set to true, default routes (0.0.0.0/0) will be deleted immediately after network creation."
}

variable "subnet_name" {
  type        = list(string)
  description = "The list of the names for the subnets being created."
}

variable "subnet_cidr" {
  type        = list(string)
  description = "The list of the CIDR ranges for the subnets."
}

variable "ext_ips" {
  type        = list(map(string))
  description = "The list of map of external IP to be created."
}
