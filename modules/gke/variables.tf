variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "cluster_name" {
  description = "GKE Cluster Name"
  type        = string
}

variable "region" {
  description = "Region"
  type        = string
}

variable "network" {
  description = "VPC Network"
  type        = string
}

variable "subnetwork" {
  description = "Subnet"
  type        = string
}

variable "deletion_protection" {
  description = "Deletion Protection Config"
  type        = bool
}