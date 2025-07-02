resource "azurerm_postgresql_flexible_server" "replica" {
  name                   = "psql-${var.project}-${var.environment}-replica"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  version                = "12"
  create_mode            = "Replica"
  source_server_id       = azurerm_postgresql_flexible_server.primary.id
  zone                   = "2"

  depends_on = [azurerm_postgresql_flexible_server.primary]

  maintenance_window {
    day_of_week  = 0
    start_hour   = 8
    start_minute = 0
  }

  tags = var.tags
}