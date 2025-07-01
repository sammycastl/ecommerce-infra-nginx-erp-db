output "blob_storage_name" {
  description = "Name of the Blob Storage account"
  value       = azurerm_storage_account.blob.name
}

output "blob_storage_primary_access_key" {
  description = "Primary access key for the Blob Storage"
  value       = azurerm_storage_account.blob.primary_access_key
  sensitive   = true
}
output "aks_cluster_name" {
  description = "Name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "aks_cluster_id" {
  description = "ID of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.id
}

output "erp1_private_ip" {
  description = "Private IP of ERP Server 1"
  value       = azurerm_network_interface.erp1.private_ip_address
}

output "erp2_private_ip" {
  description = "Private IP of ERP Server 2"
  value       = azurerm_network_interface.erp2.private_ip_address
}

output "primary_db_fqdn" {
  description = "FQDN of the primary database server"
  value       = azurerm_postgresql_flexible_server.primary.fqdn
}

output "replica_db_fqdn" {
  description = "FQDN of the replica database server"
  value       = azurerm_postgresql_flexible_server.replica.fqdn
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

output "aks_cluster_name" {
  description = "Name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}