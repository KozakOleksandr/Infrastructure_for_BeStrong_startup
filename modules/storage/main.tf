resource "azurerm_storage_account" "app_storage" {
  name                     = "${var.prefix}${var.environment}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  min_tls_version          = "TLS1_2"
  
  network_rules {
    default_action             = "Deny"
    virtual_network_subnet_ids = var.subnet_ids
    bypass                     = ["AzureServices"]
  }
  
  tags = var.tags
}

resource "azurerm_storage_share" "app_share" {
  name                 = "app-content"
  storage_account_name = azurerm_storage_account.app_storage.name
  quota                = 50
}

resource "azurerm_private_endpoint" "storage_endpoint" {
  name                = "${var.prefix}-storage-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id
  
  private_service_connection {
    name                           = "${var.prefix}-storage-privateserviceconnection"
    private_connection_resource_id = azurerm_storage_account.app_storage.id
    is_manual_connection           = false
    subresource_names              = ["file"]
  }
  
  tags = var.tags
}

# Terraform state storage account
resource "azurerm_storage_account" "terraform_state" {
  count                    = var.create_tf_state_storage ? 1 : 0
  name                     = "${var.prefix}tfstate"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  tags                     = var.tags
}

resource "azurerm_storage_container" "terraform_state_container" {
  count                 = var.create_tf_state_storage ? 1 : 0
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.terraform_state[0].name
  container_access_type = "private"
}