variable "env" {
  description = "Environment name"
  type        = string
  default     = "dev"
}
variable "cloud_region" {
  description = "Region name"
  type        = string
  default     = "use2"
}
variable "project" {
  description = "Project name"
  type        = string
  default     = "jerry"
}
variable "tier" {
  description = "Tier name"
  type        = string
  default     = "backend"
}
variable "business_unit" {
  description = "Business Unit name"
  type        = string
  default     = "orders"
}
variable "cloud_provider" {
  description = "Cloud Provider name"
  type        = string
  default     = "aws"
}
variable "team" {
  description = "Team name"
  type        = string
  default     = "DevOps"
}
variable "managed_by" {
  description = "Managed By"
  type        = string
  default     = "Terraform"
}
variable "owner" {
  description = "Owner email"
  type        = string
  default     = "j-wrathjen@yahoo.com"
}
