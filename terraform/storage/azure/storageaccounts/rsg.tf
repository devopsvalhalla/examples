resource "random_id" "resource_prefix" {
  length = 8
  special = false
}

resource "azurerm_resource_group" "rsg" {
  name     = "${random_id.resource_prefix.result}-DOV-Example-rsg"
  location = "East US"
}