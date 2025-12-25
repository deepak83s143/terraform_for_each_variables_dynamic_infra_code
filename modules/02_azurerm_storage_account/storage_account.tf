resource "azurerm_storage_account" "stg_create" {
  for_each = var.stg_config

  name                     = each.value.name
  resource_group_name      = data.azurerm_resource_group.rg[each.key].name
  location                 = data.azurerm_resource_group.rg[each.key].location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}

