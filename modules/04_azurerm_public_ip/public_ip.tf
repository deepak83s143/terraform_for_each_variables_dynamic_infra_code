data "azurerm_resource_group" "rg_details" {
  for_each = var.pip_config

  name = each.value.rg_name
}

resource "azurerm_public_ip" "pip_create" {
  for_each = var.pip_config
  
  name = each.value.name
  resource_group_name = data.azurerm_resource_group.rg_details[each.key].name
  location = data.azurerm_resource_group.rg_details[each.key].location
  allocation_method = "Static"
  sku = "Standard"
}



