terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id = "28e1e42a-4438-4c30-9a5f-7d7b488fd883"
}