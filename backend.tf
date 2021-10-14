
terraform {
  backend "kubernetes" {
    secret_suffix    = "sample"
    load_config_file = true
    namespace = "super-secure-terraform"
  }
}
