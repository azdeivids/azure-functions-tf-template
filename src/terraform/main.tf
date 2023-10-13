resource "azurerm_resource_group" "main" {
  name     = "rg-${var.environment_name}-${var.application_name}"
  location = var.location
}

data "azurerm_client_config" "current" {}
