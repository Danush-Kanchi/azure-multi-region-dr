variable "database_name" {
  default = "myappdb"
}

variable "subscription_id" {
  description = "Azure subscription ID used for this deployment"
  type        = string
}