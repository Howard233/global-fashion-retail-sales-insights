

variable "credentials" {
  description = "My Credentials"
  default     = "INPUT THE PATH TO YOUR JSON FILE"
}

variable "region" {
  description = "Region"
  default     = "INPUT YOUR REGION"
}

variable "project" {
  description = "Project"
  default     = "INPUT PROJECT ID"
}

variable "location" {
  description = "Project Location"
  default     = "INPUT LOCATION"
}

variable "bq_dataset_name" {
  description = "BigQuery Dataset Name for the project"
  default     = "INPUT DATASET NAME"
}

variable "gcs_bucket_name" {
  description = "Storage Bucket Name for the project"
  default     = "INPUT BUCKET NAME"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}