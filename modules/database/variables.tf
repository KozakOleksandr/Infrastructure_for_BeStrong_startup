variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of resource group"
  type        = string
}

variable "environment" {
  description = "Environment (dev, test, prod)"
  type        = string
}

variable "admin_login" {
  description = "SQL Server admin login"
  type        = string
  sensitive   = true
}

variable "admin_password" {
  description = "SQL Server admin password"
  type        = string
  sensitive   = true
}

variable "azuread_admin_object_id" {
  description = "Object ID of AzureAD admin"
  type        = string
}

variable "db_sku" {
  description = "SKU for SQL database"
  type        = string
  default     = "S0"
}

variable "subnet_id" {
  description = "ID of subnet for private endpoint"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}