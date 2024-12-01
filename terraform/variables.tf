variable "project_id" {
  description = "The project indicates the default GCP project ID."
  type        = string
  default     = "franklin-resume"
}

variable "region" {
  description = "The region will be used to choose the default location for regional resources. Regional resources are spread across several zones."
  type        = string
  default     = "europe-north1"
}

variable "prefix" {
  description = "Name to add to our resources"
  type        = string
  default     = "lab-franklin-"
}

variable "tags" {
  description = "Map of tags to be associated with the virtual machines, their interfaces and public IP addresses."
  default = {
    lab = "franklin"
  }
  type = map(string)
}

variable "service_account_email" {
  description = "Optional IAM Service Account (just an email) that will be granted read-only access to the secret."
  type        = string
}
