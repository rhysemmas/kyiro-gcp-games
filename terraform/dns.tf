resource "google_project_service" "dns" {
  project = var.project_name
  service = "dns.googleapis.com"

  disable_dependent_services = true
}

resource "google_dns_managed_zone" "kyiro-gcp-zone" {
  name        = "kyiro-gcp-zone"
  dns_name    = "gcp.kyiro.net."
  description = "kyiro.net delegated zone for GCP"

  depends_on = [ google_project_service.dns ]
}
