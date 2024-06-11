# Create a storage account using terraform

You need to change this part of code

```sh
   resource "google_storage_bucket" "my_bucket" {
    name          = "<Your-unique-bucket-name>"
    location      = "<location>"
    force_destroy = true
  }
