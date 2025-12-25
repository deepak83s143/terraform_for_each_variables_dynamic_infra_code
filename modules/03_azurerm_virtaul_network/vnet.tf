data "azurerm_resource_group" "rg_details" {
  for_each = var.vnet_config

  name = each.value.rg_name
}
resource "azurerm_virtual_network" "vnet_create" {
  for_each = var.vnet_config

  name = each.value.vnet_name
  resource_group_name = data.azurerm_resource_group.rg_details[each.key].name
  location = data.azurerm_resource_group.rg_details[each.key].location
  address_space = each.value.address_space

  dynamic "subnet" {
    for_each = each.value.subnet_config
    content {
    
    name = subnet.value.name
    address_prefixes = subnet.value.address_prefixes
        }
    }
}