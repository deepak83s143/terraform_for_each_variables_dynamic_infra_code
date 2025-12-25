resource "azurerm_resource_group" "rg_create" {
  for_each = var.rg_config
  name = each.value.rg_name
  location = each.value.rg_loc
}


