provider "google" {
  project     = var.project
  region      = var.region
  credentials = file(var.credentials_file)
}

resource "google_compute_network" "custom_vpc" {
  name                    = "terraform-custom-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "custom_subnet" {
  name          = "terraform-subnet"
  region        = var.region
  network       = google_compute_network.custom_vpc.id
  ip_cidr_range = "10.10.0.0/16"
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.custom_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [var.allowed_ip_range]
  direction     = "INGRESS"
  target_tags   = ["ssh-enabled"]
}
