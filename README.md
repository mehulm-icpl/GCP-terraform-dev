# GCP-terraform-dev

Welcome to the project!
For testing of the GCP terraform

## Introduction
- **Infrastructure as Code (IaC):** Define your GCP infrastructure using Terraform configuration files, making it easier to manage and reproduce.
- **Resource Provisioning:** Automatically provision GCP resources such as VM instances, networks, storage buckets, and more.
- **State Management:** Utilize Terraform's state management to keep track of the state of your infrastructure and make changes safely.


## Getting Started
To get started with GCP automation using Terraform, follow these steps:

1. Download and install Visual studio code [here](https://code.visualstudio.com/download).

2. **Installation:** Install Terraform on your local machine. You can download Terraform from [here](https://www.terraform.io/downloads.html).
   
3. **Configuration:** Clone this repository and configure your Terraform variables by editing the `terraform.tfvars` file. You can use the provided `example.tfvars` file as a template.

4. **Deployment:** Run Terraform commands to initialize, plan, and apply changes to your GCP infrastructure.
   ```sh
   terraform init
   terraform plan
   terraform apply
