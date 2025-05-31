variable "project" {}
variable "region" {
  default = "us-central1"
}
variable "allowed_ip_range" {
  description = "IP range allowed for SSH"
  default     = "0.0.0.0/0" # ⚠️ For practice. Replace with your real IP if needed.
}
