output "app_service_id" {
  description = "ID of the App Service"
  value       = azurerm_linux_web_app.app.id
}

output "app_service_url" {
  description = "URL of the App Service"
  value       = azurerm_linux_web_app.app.default_hostname
}

output "app_service_identity_principal_id" {
  description = "Principal ID of the App Service Managed Identity"
  value       = azurerm_linux_web_app.app.identity[0].principal_id
}

output "app_insights_key" {
  description = "Instrumentation key for Application Insights"
  value       = azurerm_application_insights.app_insights.instrumentation_key
  sensitive   = true
}

output "app_insights_id" {
  description = "ID of Application Insights"
  value       = azurerm_application_insights.app_insights.id
}