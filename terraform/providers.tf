variable "project_name" {}
variable "zone" {}

provider "google" {
  credentials = file("account.json")
  project     = var.project_name
  region      = "europe-west-2"
}

provider "google-beta" {
  credentials = file("account.json")
  project     = var.project_name
  region      = "europe-west-2"
}
