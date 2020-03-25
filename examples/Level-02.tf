module "Config-Level-02" {
  source  = "github.com/abhilash9/terraform-azurerm-caf//modules/Level-02"
  providers= {
      azurerm = azurerm.crossTenant-mw
      azurerm.src = azurerm.crossTenant-mw
      azurerm.dst = azurerm.crossTenant-mw
  }

  nsgAssociation_maps = [
      {
          nsg_name    = "nsg-test-01"
          subnet_name = "default"
          vnet_name   = "new-test-vnet"
          nsg_rg_name = "RG-NET-New-01"
          vnet_rg_name= "RG-NET-New-01"
      }
  ]

  rtAssociation_maps = [
      {
          rt_name     = "rt-test-01"
          subnet_name = "default"
          vnet_name   = "new-test-vnet"
          vnet_rg_name= "RG-NET-New-01"
          rt_rg_name  = "RG-NET-New-01"
      }
  ]

  vnetPeering_maps     = [
      {
          peer_connection   = "1"
          peer_names        = ["peer01","peer02"]
          rg_names          = ["RG-NET-New-01","RG-NET-New-01"]
          vnet_names        = ["new-test-vnet","new-test-vnet-02"]
          allow_virtual_network_access = [true,true]
          allow_forwarded_traffic      = [false,false]
          use_remote_gateways          = [false,false]
      }
  ]

  nic_maps = [
      {
          name          = "nic-test-01"
          rg_name       = "RG-NET-New-01"
          location      = "EastUs2"
          tags          = {
              source    = "Terraform"
          }
          ip_configuration = [
              {
                  name              = "ip-config-01"
                  vnet_rg_name      = "RG-NET-New-01"
                  vnet_name         = "new-test-vnet"
                  subnet_name       = "default"
                  priIP_allocation  = "Dynamic"
                  pubIP_address     = "pip-config-01"
                  pubIP_rg_name     = "RG-NET-New-01"
                  priIP_address     = null
              }
          ]
      }
  ]

  vpngateway_maps       = [
      {
          vpn_name           = "vpn-gw-01"
          vpn_rg_name        = "RG-NET-New-01"
          vpn_location       = "EastUs2"
          type               = "Vpn"
          vpn_type           = "RouteBased"
          vpn_gw_sku         = "Basic"
          vpn_enable_bgp     = false
          vpn_active_active  = false

          ip_configuration   =[
              {
                  ipconfig_name         = "vpn-gw-config-01"
                  pip_name              = "pip-config-02"
                  pip_rg_name           = "RG-NET-New-01"
                  subnet_name           = "GatewaySubnet"
                  vnet_name             = "new-test-vnet"
                  vnet_rg_name          = "RG-NET-New-01"
              }
          ]

          tags               = {
              source         = "Terraform"
          }
      }
  ]

  localnwgateway_maps        = [
      {
          name                  = "local-gw-01"
          rg_name               = "RG-NET-New-01"
          location              = "EastUs2"
          onprem_gw_ip          = "71.179.234.219"
          onprem_address_space  = ["10.0.0.0/24"]
          tags                  = {
              source            = "Terraform"
          }
      }
  ]

}