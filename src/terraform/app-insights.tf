resource "azurerm_application_insights" "main" {
  name                = "appi-${var.environment_name}-${var.application_name}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  application_type    = "web"
}