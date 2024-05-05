terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.27.0"
    }
  }
}


terraform {
    backend "gcs" { 
      bucket  = "satmorningexamplebucket"
      credentials = "thisismustafar-1eb734b72a8e.json"
      prefix  = "prod"
    }
}




provider "google" {
    credentials = "thisismustafar-1eb734b72a8e.json"
    project = var.project
    region = var.region
  # Configuration options
}

# This is the bucket for your state files
resource "google_storage_bucket" "raw2" {
  project = var.project
  name = "${var.data_project}-raw2"
  force_destroy = false
  uniform_bucket_level_access = true
  location = var.region
  labels = local.labels
}

locals {
    labels = {
        "data-project" = var.data_project
    }
}

variable "project" {
    type= string
    default = "thisismustafar"
    description = "ID Google project"
}

variable "region" {
    type= string
    default = "southamerica-east1"
    description = "Region Google project"
}

variable  "data_project" {
    type = string
    default = "mysat2_cicd_project"
    description = "Name of data pipeline project to use as resource prefix"
}






