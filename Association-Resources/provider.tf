provider "azurerm" {
    alias           = "crossTenant-ran"
    subscription_id = "04631fbb-0f38-45f1-b0f6-9d0c1248d1cb"
    client_id       = "4cf7b016-f455-459f-b7eb-2834a4d9ec2b"
    client_secret   = "HRanxHhC6egoEDRF7LKF1?dfX[/fZ0n:"
    tenant_id       = "fd41ee0d-0d97-4102-9a50-c7c3c5470454"
    skip_credentials_validation = true
    auxiliary_tenant_ids = ["dc902e98-0ba4-40c7-ba5a-96a53ad824fb"]
}

provider "azurerm" {
    alias           = "crossTenant-nfp"
    subscription_id = "9118106e-f85d-4887-b2f5-64e47479114b"
    client_id       = "4cf7b016-f455-459f-b7eb-2834a4d9ec2b"
    client_secret   = "HRanxHhC6egoEDRF7LKF1?dfX[/fZ0n:"
    tenant_id       = "dc902e98-0ba4-40c7-ba5a-96a53ad824fb"
    skip_credentials_validation = true
    auxiliary_tenant_ids = ["fd41ee0d-0d97-4102-9a50-c7c3c5470454"]
}