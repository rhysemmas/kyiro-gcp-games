resource "google_project_service" "container" {
  project = var.project_name
  service = "container.googleapis.com"

  disable_dependent_services = true
}

resource "google_container_registry" "registry" {
  location = "EU"
}

resource "google_container_cluster" "canterlot" {
  provider = google-beta

  name     = "canterlot"
  location = var.zone

  release_channel {
    channel = "RAPID"
  }

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1


  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "canterlot_default_pool" {
  name       = "canterlot-default-pool"
  location   = var.zone
  cluster    = google_container_cluster.canterlot.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-standard-2"

    disk_size_gb = "20"
    disk_type    = "pd-ssd"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/ndev.clouddns.readwrite"
    ]
  }
}

resource "google_compute_firewall" "gke-canterlot-minecraft" {
  name    = "gke-canterlot-minecraft"
  network = google_container_cluster.canterlot.network

  allow {
    protocol = "tcp"
    ports    = ["30000"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# data "google_compute_network" "default" {
#   name = "default"
# }
