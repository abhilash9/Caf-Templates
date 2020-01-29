locals {
  rtAssociation = {for rtAssociation_map in var.rtAssociation_maps: rtAssociation_map.rt_name => rtAssociation_map} 
}

data "azurerm_subnet" "subnetData-RT" {
    for_each            = local.rtAssociation
    name                = each.value.subnet_name
    resource_group_name = each.value.vnet_rg_name
    virtual_network_name= each.value.vnet_name
}

data "azurerm_route_table" "routeTableData" {
    for_each            = local.rtAssociation
    name                = each.value.rt_name
    resource_group_name = each.value.rt_rg_name
}

resource "azurerm_subnet_route_table_association" "subnetRTAssociation" {
    for_each            = zipmap(flatten([for subnet in data.azurerm_subnet.subnetData-RT: subnet.id]),flatten([for rt in data.azurerm_route_table.routeTableData: rt.id]))
    subnet_id           = each.key
    route_table_id      =each.value
}


