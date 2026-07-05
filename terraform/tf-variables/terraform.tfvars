// Variables definition
project_id                = "extended-ward-500913-i6"
default_region            = "us-central1"
default_zone              = "us-central1-a"
terraform_service_account = "infra-prov-svc-acc@rubberducky-476409.iam.gserviceaccount.com"

vpc_name                                  = "fdn-tst-vpc-01"
description                               = null # null value represents absence or omission. If you set an argument of a resource to null, terraform behaves as though you had completely omitted it.
auto_create_subnetworks                   = "false"
delete_default_routes                     = false
network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
