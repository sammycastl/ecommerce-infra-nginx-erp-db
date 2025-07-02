output "blob_storage_name" {
  description = "Name of the Blob Storage account"
  value       = azurerm_storage_account.ecommercesa.name
}

output "blob_storage_primary_access_key" {
  description = "Primary access key for the Blob Storage"
  value       = azurerm_storage_account.ecommercesa.primary_access_key
  sensitive   = true
}

output "nginx_endpoint" {
  description = "Endpoint for Nginx web app"
  value       = azurerm_linux_web_app.nginx.default_hostname
}

output "primary_db_fqdn" {
  description = "FQDN of the primary database server"
  value       = azurerm_postgresql_flexible_server.primary.fqdn
}

output "erp1_private_ip" {
  description = "Private IP of ERP Server 1"
  value       = azurerm_network_interface.erp1_nic.private_ip_address
}