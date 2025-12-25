data "azurerm_resource_group" "rg_details" {
  for_each = var.net_interface_config

  name = each.value.rg_name
}

data "azurerm_public_ip" "pip_details" {
  for_each = var.net_interface_config

  name = each.value.pip_name
  resource_group_name = data.azurerm_resource_group.rg_details[each.key].name
}

data "azurerm_virtual_network" "vnet_details" {
  for_each = var.net_interface_config

  name = each.value.vnet_name
  resource_group_name = data.azurerm_resource_group.rg_details[each.key].name
}

data "azurerm_subnet" "subnet_details" {
  for_each = var.net_interface_config

  name = each.value.subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet_details[each.key].name
  resource_group_name = data.azurerm_resource_group.rg_details[each.key].name
}

resource "azurerm_network_interface" "net_interface_create" {
  for_each = var.net_interface_config

  name = each.value.name
  resource_group_name = data.azurerm_resource_group.rg_details[each.key].name
  location = data.azurerm_resource_group.rg_details[each.key].location

  ip_configuration {
    name = each.value.ip_config_name
    private_ip_address_allocation = "Dynamic"
    subnet_id = data.azurerm_subnet.subnet_details[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip_details[each.key].id
  }
}

variable "net_interface_config" {
  type = map(object({
    rg_name = string
    pip_name = string
    vnet_name = string
    name = string
    ip_config_name = string
    subnet_name = string
  }))
}