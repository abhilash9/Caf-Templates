locals {
  nsgAssociation_subnet = {for nsgAssociation_map in var.nsgAssociation_maps: nsgAssociation_map.subnet_name => nsgAssociation_map} 
  #nsgAssociation_nsg    = {for nsgAssociation_map in var.nsgAssociation_maps: nsgAssociation_map.nsg_name => nsgAssociation_map}
  #       = zipmap("${data.azurerm_subnet.subnetData.nsgAssociation_subnet_ids}","${data.azurerm_network_security_group.nsgData.nsgAssociation_nsg_ids}")
}

data "azurerm_subnet" "subnetData" {
    for_each            = local.nsgAssociation_subnet
    name                = each.value.subnet_name
    resource_group_name = each.value.vnet_rg_name
    virtual_network_name= each.value.vnet_name
}

data "azurerm_network_security_group" "nsgData" {
    for_each            = local.nsgAssociation_subnet
    name                = each.value.nsg_name
    resource_group_name = each.value.nsg_rg_name
}

resource "azurerm_subnet_network_security_group_association" "subnetNSGAssociation" {
    for_each            = zipmap(flatten([for subnet in data.azurerm_subnet.subnetData: subnet.id]),flatten([for nsg in data.azurerm_network_security_group.nsgData: nsg.id]))
    subnet_id           = each.key
    network_security_group_id=each.value
}

/*
resource "azurerm_subnet_network_security_group_association" "subnetNSGAssociation" {
    #depends_on          = [azurerm_virtual_network.virtualNetwork]
    for_each            = local.nsgAssociation_subnet#flatten("${data.azurerm_virtual_network.virtualNetworkData.nsg_subnet_ids}"),"${data.azurerm_network_security_group.nsgData.nsgAssociation_nsg_ids}")
    subnet_id           = "${data.azurerm_subnet.subnetData[each.value.subnet_name]}"
    network_security_group_id= "${data.azurerm_network_security_group.nsgData[each.value.nsg_name]}"
}
*/
