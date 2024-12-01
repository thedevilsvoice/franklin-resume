terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.34.0"
    }
  }
  backend "gcs" {
    bucket = "lab-franklin-terraform"
    prefix = "cloud-function/state"
    //credentials = "credentials.json"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
  //impersonate_service_account = var.service_account_terraform
}
