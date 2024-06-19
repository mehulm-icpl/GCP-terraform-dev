# Storage account creation
resource "google_storage_bucket" "my_bucket" {
  name          = "test-bucket-icpl-2"
  location      = "US"
  force_destroy = true
}

# Upload a document to the bucket
resource "google_storage_bucket_object" "document" {
  name   = "example-document.pdf" # Name of the object in the bucket
  bucket = google_storage_bucket.my_bucket.name
  source = "C:/Users/MehulM/Downloads/Mehul Movadiya ICPL AprMayJun 2024.pptx" # Path to the local file you want to upload
}

# Create a custom IAM role
resource "google_project_iam_custom_role" "terraform_role" {
  role_id     = "terraform_dev"
  title       = "Terraform Role dev"
  description = "A custom role for managing resources"
  permissions = [
    "iam.roles.list",
    "storage.buckets.list",
    "storage.objects.list",
    "storage.objects.create",
    "compute.instances.list",
    "compute.instances.get",
    "resourcemanager.projects.get" # Console Access permission
  ]
  project = "wired-cogency-426104-a5"
}

# Create a service account
resource "google_service_account" "my_service_account" {
  account_id   = "my-service-account"
  display_name = "terraform service account"
  project      = "wired-cogency-426104-a5"
}

# Bind the custom role to the service account
resource "google_project_iam_binding" "binding" {
  project = "wired-cogency-426104-a5"
  role    = google_project_iam_custom_role.terraform_role.name

  members = [
    "user:durva.purani17@gmail.com",
  ]
}

# Create an IAM user with out creating the service account
# resource "google_project_iam_member" "my_iam_user" {
#   project = "wired-cogency-426104-a5"
#   role    = google_project_iam_custom_role.my_custom_role.name
#   member  = "user:mehulmovadiya7@gmail.com" # Replace with the desired email address
# }


# creating the vm
resource "google_compute_instance" "demo-vm" {
  name         = "demo-vm"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_lable = "demo-lable"
      }
    }
  }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }
  service_account {
    email  = google_service_account.my_service_account.email
    scopes = ["cloud-platform"]
  }
}