module "rg_create" {
  source = "../modules/01_azurerm_resource_group"
  rg_config = var.rg_config
}

# module "stg_create" {
#     depends_on = [ module.rg_create ]
#   source = "../modules/02_azurerm_storage_account"
#   stg_config = var.stg_config
# }

module "vnet_create" {
    depends_on = [ module.rg_create ]
  source = "../modules/03_azurerm_virtaul_network"
  vnet_config = var.vnet_config
}

module "pip_create" {
   depends_on = [ module.vnet_create ]
  source = "../modules/04_azurerm_public_ip"
  pip_config = var.pip_config
}

module "net_interface_create" {
   depends_on = [ module.pip_create ]
   source = "../modules/05_azurerm_network_interface"
   net_interface_config = var.net_interface_config
}

module "nsg_create" {
  depends_on = [ module.net_interface_create ]
  source = "../modules/06_azurerm_nsg"
  nsg_config = var.nsg_config
}

module "nsg_association" {
  depends_on = [ module.nsg_create ]
  source = "../modules/07_azurerm_nsg_association"
  nsg_association_config = var.nsg_association_config
}

module "vm_create" {
  depends_on = [ module.nsg_association ]
  source = "../modules/08_azurerm_virtual_machine"
  vm_config = var.vm_config
}