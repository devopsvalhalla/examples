data "azuread_client_config" "current" {}

resource "azuread_application" "sa_app" {
  name             = "${random_id.resource_prefix.result}-app-reg"
  owners           = [data.azuread_client_config.current.object_id]
}