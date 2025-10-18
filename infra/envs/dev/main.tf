module "baseline" {
  source  = "../../modules/baseline"
  project = var.project
  env     = var.env
  region  = var.region
}
output "api_base_url" { value = module.baseline.api_base_url }
