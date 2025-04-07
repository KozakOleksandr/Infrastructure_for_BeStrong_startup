resource "azurerm_service_plan" "app_plan" {
  name                = "${var.prefix}-app-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = var.sku_name
  tags                = var.tags
}

resource "azurerm_linux_web_app" "app" {
  name                = "${var.prefix}-app-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.app_plan.id
  
  identity {
    type = "SystemAssigned"
  }
  
  site_config {
    always_on              = true
    minimum_tls_version    = "1.2"
    vnet_route_all_enabled = true
  }
  
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = var.app_insights_key
    "DOCKER_REGISTRY_SERVER_URL"     = "https://${var.acr_login_server}"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }
  
  tags = var.tags
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_integration" {
  app_service_id = azurerm_linux_web_app.app.id
  subnet_id      = var.subnet_id
}

resource "azurerm_application_insights" "app_insights" {
  name                = "${var.prefix}-app-insights"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
  tags                = var.tags
}

resource "azurerm_app_service_storage_account" "app_storage_mount" {
  app_service_id       = azurerm_linux_web_app.app.id
  storage_account_name = var.storage_account_name
  storage_account_key  = var.storage_account_key
  name                 = "appfiles"
  type                 = "AzureFiles"
  share_name           = var.file_share_name
  mount_path           = "/app/files"
}