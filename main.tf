# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# Get current client configuration
data "azurerm_client_config" "current" {}

# Networking module - creates VNet and subnets
module "networking" {
  source              = "./modules/networking"
  prefix              = "bestrong"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space
  subnet_prefixes     = var.subnet_address_prefixes
  tags                = var.tags
}

# Storage module - creates storage accounts and file shares
module "storage" {
  source                     = "./modules/storage"
  prefix                     = "bestrong"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  environment                = var.environment
  subnet_ids                 = [module.networking.app_service_subnet_id, module.networking.storage_subnet_id]
  private_endpoint_subnet_id = module.networking.storage_subnet_id
  create_tf_state_storage    = true
  tags                       = var.tags
}

# Security module - creates Key Vault and ACR
module "security" {
  source                   = "./modules/security"
  prefix                   = "bestrong"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  environment              = var.environment
  acr_sku                  = var.acr_sku
  tenant_id                = data.azurerm_client_config.current.tenant_id
  app_service_principal_id = module.app_service.app_service_identity_principal_id
  keyvault_subnet_id       = module.networking.keyvault_subnet_id
  app_service_subnet_id    = module.networking.app_service_subnet_id
  tags                     = var.tags
  
  depends_on = [module.app_service]
}

# Database module - creates SQL Server and database
module "database" {
  source                  = "./modules/database"
  prefix                  = "bestrong"
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  environment             = var.environment
  admin_login             = var.sql_admin_login
  admin_password          = var.sql_admin_password
  azuread_admin_object_id = data.azurerm_client_config.current.object_id
  db_sku                  = "S0"
  subnet_id               = module.networking.db_subnet_id
  tags                    = var.tags
}

# App Service module - creates App Service and related resources
module "app_service" {
  source                = "./modules/app_service"
  prefix                = "bestrong"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  environment           = var.environment
  sku_name              = "S1"
  subnet_id             = module.networking.app_service_subnet_id
  app_insights_key      = module.app_service.app_insights_key
  acr_login_server      = module.security.acr_login_server
  storage_account_name  = module.storage.storage_account_name
  storage_account_key   = module.storage.storage_account_key
  file_share_name       = module.storage.file_share_name
  tags                  = var.tags
  
  depends_on = [module.networking, module.storage]
}