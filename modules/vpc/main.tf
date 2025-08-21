resource "google_compute_network" "this" {
  project                 = var.project_id
  name                    = var.vpc_name
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "this" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_range
  region        = var.subnet_region
  network       = google_compute_network.this.id
  depends_on    = [google_compute_network.this]
}