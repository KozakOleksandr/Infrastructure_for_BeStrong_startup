output "acr_id" {
  description = "ID of Container Registry"
  value       = azurerm_container_registry.acr.id
}

output "acr_login_server" {
  description = "Login server for Container Registry"
  value       = azurerm_container_registry.acr.login_server
}

output "key_vault_id" {
  description = "ID of Key Vault"
  value       = azurerm_key_vault.key_vault.id
}

output "key_vault_uri" {
  description = "URI of Key Vault"
  value       = azurerm_key_vault.key_vault.vault_uri
}