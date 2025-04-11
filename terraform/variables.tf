

variable "credentials" {
  description = "My Credentials"
  # default     = "INPUT THE PATH TO YOUR JSON FILE"
  default     = "/Users/haozhewang/Desktop/DataEngineeringZoomCamp/dtc-de-course-447701-05ed30e6d5bc.json"
}

variable "region" {
  description = "Region"
  default     = "us-east1"
}

variable "project" {
  description = "Project"
  default     = "dtc-de-course-447701"
}

variable "location" {
  description = "Project Location"
  default     = "us-east1"
}

variable "bq_dataset_name" {
  description = "BigQuery Dataset Name for the project"
  default     = "global_fashion_retail_sales_insights"
}

variable "gcs_bucket_name" {
  description = "Storage Bucket Name for the project"
  # default     = "{YOUR-PROJECT_ID}-fashion-insights"
  default     = "dtc-de-course-447701-fashion-insights"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}