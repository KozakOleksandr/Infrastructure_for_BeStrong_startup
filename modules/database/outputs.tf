output "sql_server_id" {
  description = "ID of SQL Server"
  value       = azurerm_mssql_server.sql_server.id
}

output "sql_server_fqdn" {
  description = "Fully qualified domain name of SQL Server"
  value       = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "sql_database_id" {
  description = "ID of SQL Database"
  value       = azurerm_mssql_database.sql_db.id
}

output "sql_private_endpoint_id" {
  description = "ID of SQL Server private endpoint"
  value       = azurerm_private_endpoint.sql_endpoint.id
}