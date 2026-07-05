// Variables Definition
project_id     = "extended-ward-500913-i6"
default_region = "us-central1"
default_zone   = "us-central1-a"

enable_apis = [
  # To create, read, and update metadata for Google Cloud Platform resources.
  "cloudresourcemanager.googleapis.com",

  # lists the available or enabled services, or disables services that service consumers no longer use.
  "serviceusage.googleapis.com",

  # To create and manage service accounts, and to manage IAM policies programmatically.
  "iam.googleapis.com",

  # To view and manage google workspace account resources like users and groups by administrators.
  "admin.googleapis.com",

  # To manage billing for Google Cloud Platform projects programmatically.
  "cloudbilling.googleapis.com",

  # To create and manage virtual machine instances, networks, disks, and images.
  "compute.googleapis.com",

  # The Service Networking API provides automatic management of network configurations necessary for certain services.
  # Like this must be enabled if you want to setup private service access for your cloud SQL instance.
  # [In general private services access is implemented as a VPC peering connection between your VPC network and
  # the Google services VPC network where your Cloud SQL instance resides.]
  "servicenetworking.googleapis.com",

  # To create and manage DNS zones and records in Google Cloud DNS.
  "dns.googleapis.com",

  # To create and manage services in Google Cloud Service Directory.
  "servicedirectory.googleapis.com",

  # This API is a core requirement if you are configuring advanced application networking, routing, or load balancing like secure web proxy within your Google Cloud project.
  "networkservices.googleapis.com",

  # Provides a collection of network performance monitoring and diagnostic capabilities.
  "networkmanagement.googleapis.com",

  # Provides insights into your network firewall configurations.
  "firewallinsights.googleapis.com",

  # Identity-Aware Proxy(Cloud IAP) controls access to your cloud applications and VMs running on Google Cloud.
  "iap.googleapis.com",

  # To create and manage Google Kubernetes Engine clusters.
  "container.googleapis.com",

  # To use the cloud run service to deploy and manage serverless containers.
  "run.googleapis.com",

  # To create and manage container images in Google Artifact Registry.
  "artifactregistry.googleapis.com",

  # To create and manage cloud build jobs in Google Cloud Build for CICD.
  "cloudbuild.googleapis.com",

  #  Lets you store and retrieve potentially-large, immutable data objects.
  "storage-api.googleapis.com",

  # Writes log entries and manages your Cloud Logging configuration.
  "logging.googleapis.com",

  # To get metrics for monitoring of google cloud resources.
  "monitoring.googleapis.com",

  # To create and manage secrets in Google Secret Manager.
  "secretmanager.googleapis.com",

  # To create and manage encryption keys in Google Cloud Key Management Service.
  "cloudkms.googleapis.com",

  # To create and manage SSL certificates in Google Cloud Certificate Manager.
  "certificatemanager.googleapis.com"
]
