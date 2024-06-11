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