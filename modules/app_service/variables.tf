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

variable "sku_name" {
  description = "SKU name for App Service Plan"
  type        = string
  default     = "S1"
}

variable "subnet_id" {
  description = "ID of subnet for VNet integration"
  type        = string
}

variable "acr_login_server" {
  description = "ACR login server URL"
  type        = string
}

variable "app_insights_key" {
  description = "Instrumentation key for Application Insights"
  type        = string
}

variable "storage_account_name" {
  description = "Name of storage account for file share"
  type        = string
}

variable "storage_account_key" {
  description = "Access key for storage account"
  type        = string
  sensitive   = true
}

variable "file_share_name" {
  description = "Name of file share to mount"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}