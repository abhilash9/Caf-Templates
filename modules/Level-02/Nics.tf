locals {
  nic              = {for nic_map in var.nic_maps: nic_map.name => nic_map} 

  #ip_configuration = {for nic_map in var.nic_maps: nic_map.ip_configuration.name => nic_map.ip_configuration}   
}

data "azurerm_subnet" "subnetData-Nic" {
  for_each              = local.nic
  
  name                  = each.value.ip_configuration[0].subnet_name
  virtual_network_name  = each.value.ip_configuration[0].vnet_name
  resource_group_name   = each.value.ip_configuration[0].vnet_rg_name
}

# data "azurerm_public_ip" "publicIP" {
#   for_each              = local.ip_configuration.pubIP_address != null 

#   name                  = each.value.ip_configuration[each.value.ip_configuration.name].pubIP_rg_name #each.value.ip_configuration[0].pubIP_address
#   resource_group_name   = each.value.ip_configuration[each.value.ip_configuration.name].pubIP_rg_name #each.value.ip_configuration[0].pubIP_rg_name
# }


resource "azurerm_network_interface" "networkInterface" {
  for_each              = local.nic

  name                  = each.key
  location              = each.value.location
  resource_group_name   = each.value.rg_name
  tags                  = each.value.tags
  dynamic "ip_configuration"{
      for_each                        = each.value.ip_configuration
      content{
        name                          = ip_configuration.value.name
        subnet_id                     = data.azurerm_subnet.subnetData-Nic[each.value.name].id
        private_ip_address_allocation = ip_configuration.value.priIP_allocation
        #public_ip_address_id          = data.azurerm_public_ip.publicIP[each.value.name].id
        private_ip_address            = ip_configuration.value.priIP_address
      }  
  }
}