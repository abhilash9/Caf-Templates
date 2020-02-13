module "Base-Resources-ran" {
  source  = "github.com/abhilash9/Caf-Templates//Base-Resources"
  providers= {
      azurerm = azurerm.crossTenant-ran
  }
  rg_maps = [
      {
          rg_name       = "RG-Test"
          rg_location   = "EastUs"
          rg_tags       = {
              source    = "Terraform"
          }
      },
      {
          rg_name       = "RG-Prod"
          rg_location   = "EastUs"
          rg_tags       = {
              source    = "Terraform"
          }
      }
  ]
}

module "Network-Resources-ran" {
  source    = "github.com/abhilash9/Caf-Templates//Network-Resources"
  providers  = {
      azurerm = azurerm.crossTenant-ran
  }
  vnet_maps = [
      {
          vnet_name        = "Hub-01"
          vnet_addr_space  = ["10.6.0.0/16"]
          vnet_rg_name     = "${module.Base-Resources-ran.resourceGroup_names[0]}"
          vnet_location    = "${module.Base-Resources-ran.resourceGroup_locations[0]}"
          vnet_tags        = "${module.Base-Resources-ran.resourceGroup_tags[0]}"
          vnet_dns_servers = null
          subnet           = [
              {
                  sub_name          = "New-01"
                  sub_addr_space    = "10.6.0.0/24"
                  sub_nsg_group     = null
              },
              {
                  sub_name          = "New-02"
                  sub_addr_space    = "10.6.1.0/24"
                  sub_nsg_group     = null
              }
          ]
      }
  ]

  nsg_maps = [
      {
          nsg_name         = "NSG-01"
          nsg_rg_name      = "${module.Base-Resources-ran.resourceGroup_names[0]}"
          nsg_location     = "${module.Base-Resources-ran.resourceGroup_locations[0]}"
          nsg_tags         = "${module.Base-Resources-ran.resourceGroup_tags[0]}"
          nsg_sec_rule     = []
      }
  ]

  rt_maps  = [
      {
          rt_name          = "RT-01"
          rt_rg_name       = "${module.Base-Resources-ran.resourceGroup_names[0]}"
          rt_location      = "${module.Base-Resources-ran.resourceGroup_locations[0]}"
          rt_disable_bgp_route_propagation = false
          rt_tags          = "${module.Base-Resources-ran.resourceGroup_tags[0]}"
          rt_route         = [
              {
                  route                = "route1"
                  route_address_prefix = "10.7.0.0/16"
                  route_next_hop_type  = "VirtualAppliance"
                  route_next_hop_in_ip_address = "10.6.0.10"
              }
          ]    
      }
  ]
}



