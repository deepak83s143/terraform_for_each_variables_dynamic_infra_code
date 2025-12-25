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