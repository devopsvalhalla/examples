resource "azurerm_storage_account" "sa" {
  name                     = "${random_id.resource_prefix.result}-sa"
  resource_group_name      = azurerm_resource_group.rsg.name
  location                 = azurerm_resource_group.rsg.location

  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = "LRS"

  cross_tenant_replication_enabled = false
  shared_access_key_enabled        = true
}