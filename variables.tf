variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "bestrong-resources"
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "East US"
}

variable "environment" {
  description = "Environment (dev, test, prod)"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "BeStrong"
    ManagedBy   = "Terraform"
  }
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for subnets"
  type        = map(string)
  default = {
    app_service = "10.0.1.0/24"
    db          = "10.0.2.0/24"
    storage     = "10.0.3.0/24"
    keyvault    = "10.0.4.0/24"
  }
}

variable "sql_admin_login" {
  description = "Admin username for SQL Server"
  type        = string
  sensitive   = true
}

variable "sql_admin_password" {
  description = "Admin password for SQL Server"
  type        = string
  sensitive   = true
}

variable "acr_sku" {
  description = "SKU for Azure Container Registry"
  type        = string
  default     = "Standard"
}

variable "app_service_plan_sku" {
  description = "SKU for App Service Plan"
  type        = map(string)
  default = {
    tier = "Standard"
    size = "S1"
  }
}