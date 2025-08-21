variable "nodepool_name" {
  description = "Nodepool Name"
  type        = string
}

variable "region" {
  description = "Region"
  type        = string
}

variable "cluster_name" {
  description = "GKE Cluster Name"
  type        = string
}

variable "node_count" {
  description = "How many node that want to provision"
  type        = number
}

variable "preemptible" {
  description = "Is node using preemtible ?"
  type        = bool
}

variable "machine_type" {
  description = "Instance type"
  type        = string
}

variable "service_account_email" {
  description = "Service Account Created"
  type        = string
}

variable "disk_size_gb" {
  description = "Size of disk in GB"
  type        = number
}