# Create Cloud Router
resource "google_compute_router" "this" {
  name    = var.router_name
  network = var.vpc_name
  region  = var.region
}

# Create Cloud NAT
resource "google_compute_router_nat" "nat" {
  name                   = var.nat_name
  router                 = google_compute_router.this.name
  region                 = var.region
  nat_ip_allocate_option = "AUTO_ONLY"

  # Only NAT specific subnets
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = var.subnet_name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  log_config {
    enable = true
    filter = "ALL"
  }
}