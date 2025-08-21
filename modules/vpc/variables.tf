variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet Name (ex. Jakarta > asia-southeast-2)"
  type        = string
}

variable "subnet_range" {
  description = "CIDR Range"
  type        = string
}

variable "subnet_region" {
  description = "GCP Subnet Region"
  type        = string
}