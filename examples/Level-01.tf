module "Config-Level-01" {
  source  = "github.com/abhilash9/terraform-azurerm-caf//modules/Level-01"
  providers= {
      azurerm = azurerm.crossTenant-mw
      azurerm.src = azurerm.crossTenant-mw
      azurerm.dst = azurerm.crossTenant-mw
  }

  rg_maps = [
      {
          rg_name       = "RG-NET-New-01"
          rg_location   = "EastUs2"
          rg_tags       = {
              source    = "Terraform"
          }
      },
      {
          rg_name       = "RG-NET-New-02"
          rg_location   = "EastUs2"
          rg_tags       = {
              source    = "Terraform"
          }
      }
  ]

    vnet_maps = [
        {
            vnet_name        = "new-test-vnet"
            vnet_addr_space  = ["10.14.0.0/16"]
            vnet_rg_name     = "RG-NET-New-01"
            vnet_location    = "EastUS2"
            vnet_tags        = {
                source       = "Terraform"
            }
            vnet_dns_servers = null
            subnet           = [
                {
                    sub_name          = "default"
                    sub_addr_space    = "10.14.0.0/24"
                    sub_nsg_name      = null
                },
                {
                    sub_name          = "default-01"
                    sub_addr_space    = "10.14.1.0/24"
                    sub_nsg_name      = null
                },
                {
                    sub_name          = "default-02"
                    sub_addr_space    = "10.14.2.0/24"
                    sub_nsg_name      = null
                },
                {
                    sub_name          = "GatewaySubnet"
                    sub_addr_space    = "10.14.3.0/27"
                    sub_nsg_name      = null
                }
            ]
        },
        {
            vnet_name        = "new-test-vnet-02"
            vnet_addr_space  = ["10.16.0.0/16"]
            vnet_rg_name     = "RG-NET-New-01"
            vnet_location    = "EastUS2"
            vnet_tags        = {
                source       = "Terraform"
            }
            vnet_dns_servers = null
            subnet           = [
                {
                    sub_name          = "default"
                    sub_addr_space    = "10.16.0.0/24"
                    sub_nsg_name      = null
                },
                {
                    sub_name          = "default-01"
                    sub_addr_space    = "10.16.1.0/24"
                    sub_nsg_name      = null
                },
                {
                    sub_name          = "default-02"
                    sub_addr_space    = "10.16.2.0/24"
                    sub_nsg_name      = null
                }
            ]
        }
    ]
  pip_maps     = [
      {
          name              = "pip-config-01"
          rg_name           = "RG-NET-New-01"
          location          = "EastUs2"
          sku               = "Basic"
          allocation_method = "Static"
          dns_label         = null
          pip_prefix_id     = null
          tags              = {
              source  = "Terraform"
          }
      },
      {
          name              = "pip-config-02"
          rg_name           = "RG-NET-New-01"
          location          = "EastUs2"
          sku               = "Basic"
          allocation_method = "Dynamic"
          dns_label         = null
          pip_prefix_id     = null
          tags              = {
              source  = "Terraform"
          }
      }      
  ]
  nsg_maps = [
      {
          nsg_name        = "nsg-test-01"
          nsg_rg_name     = "RG-NET-New-01"
          nsg_location    = "EastUs2"
          nsg_tags    = {
              source  = "Terraform"  
          }
        nsg_sec_rule  = []
      }
  ]

  rt_maps  = [
      {
          rt_name         = "rt-test-01"
          rt_rg_name      = "RG-NET-New-01"
          rt_location     = "EastUs2"
          rt_disable_bgp_route_propagation = true 
          rt_tags         = {
              source      = "Terraform"
          }
          rt_route        = []
      }
  ]

  stracc_maps         = [
      {
          name              = "samwterraformtest01"
          location          = "EastUs2"
          rg_name           = "RG-NET-New-01"
          account_tier      = "Standard"
          account_replication_type = "LRS"
          tags              = {
              source        = "terraform"
          }
      }
  ]

  manageddisk_maps      = [
      {
          disk_name          = "Disk-01"
          location           = "EastUs2"
          rg_name            = "RG-NET-New-01"
          storage_type       = "Standard_LRS"
          create_option      = "Empty"
          disk_size_gb       = "32"
          tags               = {
              source         = "Terraform"
          }
      }
  ]

  avset_maps          = [
      {
          name        = "av-set-01"
          rg_name     = "RG-NET-New-01"
          location    = "EastUs2"
          tags        = {
              source  = "Terraform"
          }
          ud_count    = 5
          fd_count    = 3
      }
  ]

}

