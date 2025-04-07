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

variable "subnet_ids" {
  description = "IDs of subnets for network rules"
  type        = list(string)
}

variable "private_endpoint_subnet_id" {
  description = "ID of subnet for private endpoint"
  type        = string
}

variable "create_tf_state_storage" {
  description = "Whether to create Terraform state storage"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}
