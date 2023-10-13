resource random_pet name {
  length = 1
}

resource azurerm_resource_group main {
  name     = "rg-${var.env_name}-${random_pet.name.id}"
  location = var.location
}

data "azurerm_client_config" "current" {}
