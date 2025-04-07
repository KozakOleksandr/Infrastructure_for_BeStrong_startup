output "storage_account_id" {
  description = "ID of storage account"
  value       = azurerm_storage_account.app_storage.id
}

output "storage_account_name" {
  description = "Name of storage account"
  value       = azurerm_storage_account.app_storage.name
}

output "storage_account_key" {
  description = "Primary access key for storage account"
  value       = azurerm_storage_account.app_storage.primary_access_key
  sensitive   = true
}

output "file_share_name" {
  description = "Name of file share"
  value       = azurerm_storage_share.app_share.name
}

output "terraform_state_storage_account_name" {
  description = "Name of storage account for Terraform state"
  value       = var.create_tf_state_storage ? azurerm_storage_account.terraform_state[0].name : null
}

output "terraform_state_container_name" {
  description = "Name of container for Terraform state"
  value       = var.create_tf_state_storage ? azurerm_storage_container.terraform_state_container[0].name : null
}
