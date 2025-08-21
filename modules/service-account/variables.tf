variable "account_id" {
  description = "The ID of the service account to create."
  type        = string
}

variable "display_name" {
  description = "The display name of the service account."
  type        = string
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "roles" {
  description = "List of IAM roles to assign to the service account"
  type        = list(string)
}