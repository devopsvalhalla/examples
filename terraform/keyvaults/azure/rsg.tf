resource "azurerm_resource_group" "akv_rsg" {
  name     = "DOV-Ansible-Keyvault-Example"
  location = "East US"
}