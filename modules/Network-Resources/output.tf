#---------------------------------------------------------------------------------------------
# Output from the VNets-Subnets Config
#---------------------------------------------------------------------------------------------
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

#---------------------------------------------------------------------------------------------
# Output from the NSGs-Rules Config
#---------------------------------------------------------------------------------------------
output "nsg_ids" {
  value       = [for nsg in azurerm_network_security_group.networkSecurityGroup: nsg.id ]
  description = ""
}

#---------------------------------------------------------------------------------------------
# Output from the RouteTables-Routes Config
#---------------------------------------------------------------------------------------------
output "rt_ids" {
  value       = [for rt in azurerm_route_table.routeTable: rt.id]
  description = ""
}

output "rt_subnets" {
  value       = [for rt in azurerm_route_table.routeTable: rt.subnets]
  description = ""
}

#---------------------------------------------------------------------------------------------
# Output from the NSG-Associations Config
#---------------------------------------------------------------------------------------------
/*
output "nsgAssociation_subnet_ids" {
  value       = flatten([for subnet in data.azurerm_subnet.subnetData: subnet.id])
  description = ""
}

output "nsgAssociation_nsg_ids" {
  value       = flatten([for nsg in data.azurerm_network_security_group.nsgData: nsg.id])
  description = ""
}

output "test" {
  value       = zipmap(flatten([for subnet in data.azurerm_subnet.subnetData: subnet.id]),flatten([for nsg in data.azurerm_network_security_group.nsgData: nsg.id]))
  description = ""
}
*/
