resource "azurerm_application_insights" "main" {
  name                = "appi-${var.environment_name}-${random_pet.name.id}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  application_type    = "web"
}