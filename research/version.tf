terraform {
  required_version = ">= 1.4"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.48.0"
    }
  }

  backend "gcs" {
    bucket = "haeckal-terraform-state-files"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  #   zone    = var.zone
}