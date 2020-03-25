output "nic_maps" {
  value       = azurerm_network_interface.networkInterface
  description = ""
}

output "nsgAssociation_maps" {
  value       = azurerm_subnet_network_security_group_association.subnetNSGAssociation
  description = ""
}

output "rtAssociation_maps" {
  value       = azurerm_subnet_route_table_association.subnetRTAssociation
  description = ""
}

output "vpngateway_maps" {
  value       = azurerm_virtual_network_gateway.vpnGateway
  description = ""
}

output "localnwgateway_maps" {
  value       = azurerm_local_network_gateway.localNwGateway
  description = ""
}