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