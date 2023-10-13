resource "azurerm_key_vault" "main" {
  name                        = "kv-${var.env_name}-${random_pet.name.id}"
  location                    = azurerm_resource_group.main.location
  resource_group_name         = azurerm_resource_group.main.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name = "standard"
}


resource "azurerm_key_vault_access_policy" "terraform-user" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_user_assigned_identity.functions.principal_id
  depends_on   = [ azurerm_key_vault.main ]

  secret_permissions = [
    "Get", "Backuk", "Delete", "List", "Purge", "Recover", "Restore", "Set"
  ]
}

resource "azurerm_key_vault_access_policy" "function-user" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_user_assigned_identity.functions.principal_id
  depends_on   = [ azurerm_key_vault.main ]

  secret_permissions = [
    "Get"
  ]
}