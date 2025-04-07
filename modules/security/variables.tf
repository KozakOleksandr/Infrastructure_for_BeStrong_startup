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

variable "acr_sku" {
  description = "SKU for Azure Container Registry"
  type        = string
  default     = "Standard"
}

variable "tenant_id" {
  description = "Tenant ID for Azure AD"
  type        = string
}

variable "app_service_principal_id" {
  description = "Principal ID of App Service identity"
  type        = string
}

variable "keyvault_subnet_id" {
  description = "ID of subnet for Key Vault"
  type        = string
}

variable "app_service_subnet_id" {
  description = "ID of App Service subnet"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}