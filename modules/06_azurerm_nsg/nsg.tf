data "azurerm_resource_group" "rd_details" {
  for_each = var.nsg_config

  name = each.value.rg_name
}


resource "azurerm_network_security_group" "nsg" {
    for_each = var.nsg_config
  name                = each.value.nsg_name
  resource_group_name = data.azurerm_resource_group.rd_details[each.key].name
  location            = data.azurerm_resource_group.rd_details[each.key].location

  dynamic "security_rule" {
    for_each = each.value.security_rule
    content {
    name                       = security_rule.value.rule_name
    priority                   = security_rule.value.priority
    direction                  = security_rule.value.direction
    access                     = "Allow"
    protocol                   = security_rule.value.protocol
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
      }
    }
}