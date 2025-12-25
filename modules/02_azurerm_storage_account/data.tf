data "azurerm_resource_group" "rg" {
  for_each = var.stg_config
  name = each.value.rg_name
}