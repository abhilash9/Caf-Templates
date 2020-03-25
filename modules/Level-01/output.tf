output "vnet_maps" {
  value       = azurerm_virtual_network.virtualNetwork
  description = "Outputs all VNet and Subnet objects"
}

output "nsg_maps" {
  value       = azurerm_network_security_group.networkSecurityGroup
  description = "Outputs all NSG and NSG rules objects"
}

output "rt_maps" {
  value       = azurerm_route_table.routeTable
  description = "Outputs all Route table and route rule objects"
}

output "pip_maps" {
  value       = azurerm_public_ip.publicIP
  description = ""
}

output "rg_maps" {
  value       = azurerm_resource_group.resourceGroup
  description = ""
}

output "stracc_maps" {
  value       = azurerm_storage_account.storageAccounts
  description = ""
}

output "manageddisk_maps" {
  value       = azurerm_managed_disk.managedDisk
  description = ""
}

output "avset_maps" {
  value       = azurerm_availability_set.availabilitySets
  description = ""
}
