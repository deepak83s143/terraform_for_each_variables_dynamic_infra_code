data "azurerm_network_interface" "interface_details" {
  for_each = var.nsg_association_config
  name = each.value.interface_name
  resource_group_name = each.value.rg_name
}

data "azurerm_network_security_group" "nsg_details" {
  for_each = var.nsg_association_config
  name = each.value.nsg_name
  resource_group_name = each.value.rg_name
}
resource "azurerm_network_interface_security_group_association" "nsg_association" {
    for_each = var.nsg_association_config
    network_interface_id = data.azurerm_network_interface.interface_details[each.key].id
    network_security_group_id = data.azurerm_network_security_group.nsg_details[each.key].id
}


variable "nsg_association_config" {
  type = map(object({
    interface_name = string
    rg_name = string
    nsg_name = string
  }))
}