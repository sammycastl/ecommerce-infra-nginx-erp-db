provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

data "azurerm_resource_group" "rg" {
  name = "rg-${var.project}-${var.environment}"
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = "rg-${var.project}-${var.environment}"
  location = var.location
  tags     = var.tags
}
