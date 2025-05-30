output "vpc_name" {
  value = google_compute_network.custom_vpc.name
}

output "subnet_name" {
  value = google_compute_subnetwork.custom_subnet.name
}
