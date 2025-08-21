resource "google_service_account" "this" {
  account_id   = var.account_id
  display_name = var.display_name
}

resource "google_project_iam_member" "this" {
  for_each = toset(var.roles) # iterate over all roles
  project  = var.project_id
  role     = each.value
  member   = "serviceAccount:${google_service_account.this.email}"
}