resource "azurerm_storage_account" "ecommercesa" {
  name                     = "ecommercesa${lower(var.project)}${lower(var.environment)}"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  blob_properties {
    versioning_enabled = true
    change_feed_enabled = true
  }

  tags = var.tags
}

resource "azurerm_storage_container" "content" {
  name                  = "ecommerce-content"
  storage_account_id  = azurerm_storage_account.ecommercesa.id
  container_access_type = "private"
}

resource "azurerm_storage_blob" "blob" {
  name                   = "blob-${var.project}-${var.environment}"
  storage_account_name   = azurerm_storage_account.ecommercesa.name
  storage_container_name = azurerm_storage_container.content.name
  type                   = "Block"
}

