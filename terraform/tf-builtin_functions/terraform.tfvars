// Variables definition
project_id     = "extended-ward-500913-i6"
default_region = "us-central1"
default_zone   = "us-central1-a"

vpc_name                = "tst-vpc-01"
vpc_description         = "     Foundation application vpc network     "
auto_create_subnetworks = "false"
delete_default_routes   = false
subnet_name             = ["fdn-tst-subnet-01", "fdn-tst-subnet-02"]
subnet_cidr             = ["10.0.40.0/24", "10.0.42.0/24"]

ext_ips = [
  {
    eip_name         = "fdn-tst-eip-01"
    eip_description  = "External IP for webserber virtual machine"
    eip_network_tier = "PREMIUM"
  },
  {
    eip_name = "fdn-tst-eip-02"
  }
]
