// Variables definition
project_id     = "extended-ward-500913-i6"
default_region = "us-central1"
default_zone   = "us-central1-a"

vpc_name                = "fdn-tst-vpc-01"
auto_create_subnetworks = "false"
delete_default_routes   = false

subnet_data = {
  fdn-tst-subnet-01 = "10.0.40.0/24"
  fdn-tst-subnet-02 = "10.0.42.0/24"
}

eip_names = ["fdn-tst-eip-01", "fdn-tst-eip-02"]
