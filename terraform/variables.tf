variable "database_name" {
  default = "myappdb"
}

variable "subscription_id" {
  description = "Azure subscription ID used for this deployment"
  type        = string
}

variable "project_name" {

  description = "map the resources to a project name"
  type        = string
  default     = "azure-multi-region-dr"
}

variable "resource_group_name" {
  description = "Name of the resource group containing the DR platform"
  type        = string
  default     = "azure-multi-region-dr-rg"
}

variable "primary_location" {
  description = "Azure region for the primary infrastructure resources"
  type        = string
  default     = "East US"
}