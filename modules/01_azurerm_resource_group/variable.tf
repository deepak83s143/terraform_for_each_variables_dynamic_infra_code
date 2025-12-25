variable "rg_config" {
  type = map(object({
    rg_name = string
    rg_loc = string
  }))
}