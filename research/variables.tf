variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "region" {
  description = "GCP Default Region"
  type        = string
  default     = "asia-southeast2"
}

# variable "zone" {
#   description = "GCP Default Zone"
#   type        = string
#   default     = "asia-southeast-2"
# }

variable "subnet_name" {
  description = "GCP Subnet Name"
  type        = string
}

variable "subnet_range" {
  description = "GCP Subnet Range"
  type        = string
}

variable "subnet_region" {
  description = "GCP Subnet Region"
  type        = string
  default     = "asia-southeast2"
}

variable "router_name" {
  description = "GCP Router Name"
  type        = string
}

variable "nat_name" {
  description = "NAT Name"
  type        = string
}

# variable "deletion_protection" {
#   description = "Deletion Protection Config"
#   type        = bool
#   default     = true
# }

variable "service_accounts" {
  description = "List of Service Account"
  type = list(object({
    account_id   = string
    display_name = string
    roles        = list(string)
  }))
}

variable "gke_clusters" {
  description = "A map of GKE cluster configurations."
  type = map(object({
    cluster_name        = string
    region              = string
    deletion_protection = optional(bool, true)
  }))
}

variable "nodepools" {
  description = "Nodepool Configuration"
  type = list(object({
    name            = string
    cluster_name    = string
    node_count      = number
    preemptible     = bool
    machine_type    = string
    disk_size_gb    = number
    service_account = string
  }))
}