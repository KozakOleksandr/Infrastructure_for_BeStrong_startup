resource "azurerm_mssql_server" "sql_server" {
  name                         = "${var.prefix}-sqlserver-${var.environment}"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password
  
  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = var.azuread_admin_object_id
  }
  
  tags = var.tags
}

resource "azurerm_mssql_database" "sql_db" {
  name      = "${var.prefix}db"
  server_id = azurerm_mssql_server.sql_server.id
  sku_name  = var.db_sku
  tags      = var.tags
}

resource "azurerm_private_endpoint" "sql_endpoint" {
  name                = "${var.prefix}-sql-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  
  private_service_connection {
    name                           = "${var.prefix}-sql-privateserviceconnection"
    private_connection_resource_id = azurerm_mssql_server.sql_server.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }
  
  tags = var.tags
}