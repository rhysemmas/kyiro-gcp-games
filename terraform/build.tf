resource "google_project_service" "cloud-build" {
  project = var.project_name
  service = "cloudbuild.googleapis.com"

  disable_dependent_services = true
}
