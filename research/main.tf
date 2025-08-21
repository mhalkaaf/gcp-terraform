module "network" {
  source        = "../modules/vpc"
  vpc_name      = var.vpc_name
  subnet_range  = var.subnet_range
  subnet_name   = var.subnet_name
  subnet_region = var.subnet_region
  project_id    = var.project_id
}

module "nat" {
  source      = "../modules/nat"
  router_name = var.router_name
  region      = var.region
  nat_name    = var.nat_name
  vpc_name    = module.network.vpc_name
  subnet_name = module.network.subnet_name
  depends_on  = [module.network]
}

module "service_accounts" {
  source       = "../modules/service-account"
  for_each     = { for sa in var.service_accounts : sa.account_id => sa }
  project_id   = var.project_id
  account_id   = each.value.account_id
  display_name = each.value.display_name
  roles        = each.value.roles
}

module "gke" {
  source              = "../modules/gke"
  for_each            = var.gke_clusters
  project_id          = var.project_id
  cluster_name        = each.value.cluster_name
  deletion_protection = each.value.deletion_protection
  region              = each.value.region
  network             = module.network.vpc_name
  subnetwork          = module.network.subnet_name
  depends_on          = [module.service_accounts]
}

module "gke-nodepools" {
  source                = "../modules/gke-nodepool"
  for_each              = { for np in var.nodepools : "${np.cluster_name}-${np.name}" => np }
  nodepool_name         = each.value.name
  region                = var.region
  cluster_name          = module.gke[each.value.cluster_name].name
  node_count            = each.value.node_count
  preemptible           = each.value.preemptible
  machine_type          = each.value.machine_type
  disk_size_gb          = each.value.disk_size_gb
  service_account_email = module.service_accounts[each.value.service_account].email
  depends_on            = [module.gke, module.service_accounts]
}