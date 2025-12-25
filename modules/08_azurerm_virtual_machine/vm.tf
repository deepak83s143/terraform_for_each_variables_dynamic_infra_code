data "azurerm_resource_group" "rg_details" {
  for_each = var.vm_config
  name = each.value.rg_name
}

data "azurerm_network_interface" "interface_details" {
  for_each = var.vm_config
  name = each.value.interface_name
  resource_group_name = each.value.rg_name
}

resource "azurerm_linux_virtual_machine" "vm_create" {
  for_each = var.vm_config
  name = each.value.vm_name
  resource_group_name = data.azurerm_resource_group.rg_details[each.key].name
  location = data.azurerm_resource_group.rg_details[each.key].location
  size = each.value.size
  network_interface_ids = [ data.azurerm_network_interface.interface_details[each.key].id ]
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = false
  os_disk {
    storage_account_type = each.value.storage_account_type
    caching = each.value.caching
  }
  source_image_reference {
    publisher = each.value.publisher
    offer = each.value.offer
    sku = each.value.sku
    version = each.value.version
  }
}

variable "vm_config" {
  type = map(object({
    rg_name = string
    interface_name = string
    vm_name = string
    size = string
    admin_username = string
    admin_password = string
    storage_account_type = string
    caching = string
    publisher = string
    offer = string
    sku = string
    version = string
  }))
}