provider "google" {
  project = "wired-cogency-426104-a5"
  region  = "us-central1"
  credentials = file("C:/Users/MehulM/Downloads/wired-cogency-426104-a5-227fb6c443c9.json")
}

# resource "google_project" "my_project_terraform" {
#   name       = "my_project_terraform"
#   project_id = "my-new-project-123"
#   org_id     = "your-organization-id"
#   billing_account = "your-billing-account-id"
# }

resource "google_storage_bucket" "my_bucket" {
  name          = "test-bucket-icpl-2"
  location      = "US"
  force_destroy = true
}