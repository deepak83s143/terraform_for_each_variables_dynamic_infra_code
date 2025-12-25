variable "rg_config" {
  type = map(object({
    rg_name = string
    rg_loc = string
  }))
}
# variable "stg_config" {
#   type = map(object({
#     name = string
#     account_tier = string
#     account_replication_type = string
#     rg_name = string
#   }))
# }

variable "vnet_config" {
  type = map(object({
    rg_name = string
    vnet_name = string
    address_space = list(string)
    subnet_config = list(object({
      name = string
      address_prefixes = list(string)
    }))
  }))
}


variable "pip_config" {
  type = map(object({
    name = string
    rg_name = string
  }))
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


variable "nsg_config" {
  type = map(object({
    rg_name = string
    nsg_name = string
    security_rule = map(object({
        rule_name = string
        priority = number
        direction = string
        protocol = string 
        }))
  }))
}

variable "nsg_association_config" {
  type = map(object({
    interface_name = string
    rg_name = string
    nsg_name = string
  }))
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
