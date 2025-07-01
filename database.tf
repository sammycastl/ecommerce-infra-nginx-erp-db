resource "azurerm_postgresql_flexible_server" "primary" {
  name                   = "psql-${var.project}-${var.environment}-primary"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  version                = "12"
  administrator_login    = var.db_admin_username
  administrator_password = var.db_admin_password
  storage_mb             = 10240  
  sku_name               = "B_Standard_B1ms"  
  zone                   = "1"

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  maintenance_window {
    day_of_week  = 0
    start_hour   = 8
    start_minute = 0
  }

  delegated_subnet_id = azurerm_subnet.db.id
  private_dns_zone_id = azurerm_private_dns_zone.db.id

  tags = var.tags
}