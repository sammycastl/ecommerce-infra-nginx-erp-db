resource "azurerm_storage_account" "blob" {
  name                     = "blob${lower(var.project)}${lower(var.environment)}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  blob_properties {
    versioning_enabled = true
    change_feed_enabled = true
  }

  tags = var.tags
}

resource "azurerm_storage_container" "static" {
  name                  = "static-content"
  storage_account_name  = azurerm_storage_account.blob.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "uploads" {
  name                  = "user-uploads"
  storage_account_name  = azurerm_storage_account.blob.name
  container_access_type = "private"
}