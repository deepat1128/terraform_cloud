variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "waf_policy_name" {
  type        = string
  description = "Name of the WAF policy"
}

variable "managed_rules" {
  type = list(object({
    rule_set_type    = string
    rule_set_version = string
  }))
  description = "List of managed rule sets for the WAF policy"
}


variable "tags" {
  type        = map(string)
  description = "Tags for the WAF policy"
  default     = {
    environment = "dev"
    owner       = "deepa"
  }
}
