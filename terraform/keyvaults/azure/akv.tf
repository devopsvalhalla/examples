resource "azurerm_key_vault" "dov_akv" {
  name                        = "DOV-Demo-Keyvault"
  location                    = azurerm_resource_group.akv_rsg.location
  resource_group_name         = azurerm_resource_group.akv_rsg.name
  enabled_for_disk_encryption = false
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = false

  sku_name = "standard"

  network_acls {
    default_action = "Deny"
    bypass = "AzureServices"
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get","List","Set","Delete"
    ]

    storage_permissions = [
      "Get",
    ]
  }

  depends_on = [
    azurerm_resource_group.akv_rsg
  ]
}