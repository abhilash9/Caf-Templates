locals {
  vpngateway = {for vpngateway_map in var.vpngateway_maps: vpngateway_map.vpn_name => vpngateway_map} 
}

data "azurerm_public_ip" "publicIP-VPN" {
  for_each              = local.vpngateway

  name                  = each.value.ip_configuration[0].pip_name
  resource_group_name   = each.value.ip_configuration[0].pip_rg_name
}

data "azurerm_subnet" "subnetData-VPN" {
  for_each              = local.vpngateway

  name                  = each.value.ip_configuration[0].subnet_name
  virtual_network_name  = each.value.ip_configuration[0].vnet_name
  resource_group_name   = each.value.ip_configuration[0].vnet_rg_name
}

resource "azurerm_virtual_network_gateway" "vpnGateway" {
  for_each              = local.vpngateway

  name                  = each.value.vpn_name
  resource_group_name   = each.value.vpn_rg_name
  location              = each.value.vpn_location
  type                  = each.value.type
  vpn_type              = each.value.vpn_type
  enable_bgp            = each.value.vpn_enable_bgp
  active_active         = each.value.vpn_active_active
  sku                   = each.value.vpn_gw_sku

  dynamic "ip_configuration"{
      for_each          = each.value.ip_configuration

      content{
          name                  = ip_configuration.value.ipconfig_name
          public_ip_address_id  = data.azurerm_public_ip.publicIP-VPN[each.value.vpn_name].id
          subnet_id             = data.azurerm_subnet.subnetData-VPN[each.value.vpn_name].id
      }
  }

  tags                  = each.value.tags

}