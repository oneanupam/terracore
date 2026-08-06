// Variables definition
project_id                = "extended-ward-500913-i6"
default_region            = "us-central1"
default_zone              = "us-central1-a"
business_unit             = "fdn" # short code for business unit, e.g. (fdn: foundation)
environment               = "tst" # short code for environment, e.g. (tst: test, bld: build, pre: preprod, prd: production)
terraform_service_account = "infra-prov-svc-acc@extended-ward-500913-i6.iam.gserviceaccount.com"

vpc_name                                  = "vpc-01"
description                               = null # this variable has been deprecated and will be removed in future versions. Use vpc_description instead.
vpc_description                           = null # null value represents absence or omission. If you set an argument of a resource to null, terraform behaves as though you had completely omitted it.
auto_create_subnetworks                   = "false"
delete_default_routes                     = false
network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
