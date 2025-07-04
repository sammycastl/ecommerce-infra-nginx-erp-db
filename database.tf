resource "azurerm_postgresql_flexible_server" "primary" {
  name                   = "psql-${var.project}-${var.environment}-primary"
  resource_group_name    = data.azurerm_resource_group.rg.name
  location               = data.azurerm_resource_group.rg.location
  version                = "12"
  administrator_login    = var.db_admin_username
  administrator_password = var.db_admin_password
  storage_mb             = 32768  
  sku_name               = "GP_Standard_D2s_v3"  
  zone                   = "1"

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  high_availability {
    mode = "ZoneRedundant"
  }

  maintenance_window {
    day_of_week  = 0
    start_hour   = 8
    start_minute = 0
  }

  tags = var.tags
}