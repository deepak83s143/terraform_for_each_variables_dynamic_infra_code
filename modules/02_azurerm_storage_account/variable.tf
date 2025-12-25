variable "stg_config" {
  type = map(object({
    name = string
    rg_name = string
    account_tier = string
    account_replication_type = string
  }))
}