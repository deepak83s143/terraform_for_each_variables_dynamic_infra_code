variable "pip_config" {
  type = map(object({
    name = string
    rg_name = string
  }))
}