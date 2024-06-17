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
resource "google_project_iam_custom_role" "my_custom_role" {
  role_id     = "myCustomRole_dev"
  title       = "My Custom Role"
  description = "A custom role for managing resources"
  permissions = [
    "iam.roles.list",
    "storage.buckets.list",
    "resourcemanager.projects.get" # Console Access permission
  ]
  project = "wired-cogency-426104-a5"
}

# Create a service account

# resource "google_service_account" "my_service_account" {
#   account_id   = "my-service-account"
#   display_name = "My Service Account"
#   project      = "wired-cogency-426104-a5"
# }

# # Bind the custom role to the service account
# resource "google_project_iam_binding" "binding" {
#   project = "wired-cogency-426104-a5"
#   role    = google_project_iam_custom_role.my_custom_role.name

#   members = [
#     "serviceAccount:${google_service_account.my_service_account.email}",
#   ]
# }

# Assuming you have already configured the required GCP provider settings

# Create an IAM user
resource "google_project_iam_member" "my_iam_user" {
  project = "wired-cogency-426104-a5"
  role    = google_project_iam_custom_role.my_custom_role.name
  member  = "user:mehulmovadiya7@gmail.com" # Replace with the desired email address
}