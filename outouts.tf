output "app_service_url" {
  description = "URL of the App Service"
  value       = module.app_service.app_service_url
}

output "app_service_id" {
  description = "ID of the App Service"
  value       = module.app_service.app_service_id
}

output "acr_login_server" {
  description = "Login server for Azure Container Registry"
  value       = module.security.acr_login_server
}

output "key_vault_uri" {
  description = "URI of the Key Vault"
  value       = module.security.key_vault_uri
}

output "sql_server_fqdn" {
  description = "Fully qualified domain name of the SQL Server"
  value       = module.database.sql_server_fqdn
}

output "storage_account_name" {
  description = "Name of the Storage Account"
  value       = module.storage.storage_account_name
}

output "terraform_state_storage" {
  description = "Storage account name for Terraform state"
  value       = module.storage.terraform_state_storage_account_name
}

output "terraform_state_container" {
  description = "Container name for Terraform state"
  value       = module.storage.terraform_state_container_name
}

output "vnet_name" {
  description = "Name of the Virtual Network"
  value       = module.networking.vnet_name
}