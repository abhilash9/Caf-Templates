#---------------------------------------------------------------------------------------------
# Output from the VNET-Peerings Config
#---------------------------------------------------------------------------------------------
output "virtualNetworkPeering_peer_ids_1" {
  value       = azurerm_virtual_network_peering.vnet_peer_1.id
  description = ""
}

output "virtualNetworkPeering_peer_ids_2" {
  value       = azurerm_virtual_network_peering.vnet_peer_2.id
  description = ""
}