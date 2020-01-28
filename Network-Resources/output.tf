output "vnet_ids" {
  value = [for vnet in azurerm_virtual_network.virtualNetwork: vnet.id]
}

output "vnet_names" {
  value       = [for vnet in azurerm_virtual_network.virtualNetwork: vnet.name]
  description = ""
}

output "subnet_ids" {
  value       = [for vnet in azurerm_virtual_network.virtualNetwork: vnet.subnet.*.id]
  description = ""
}

output "vnet_addressSpace" {
  value       = [for vnet in azurerm_virtual_network.virtualNetwork: vnet.address_space]
  description = ""
}