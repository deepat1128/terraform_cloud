variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
}

variable "waf_policy_name" {
  description = "Name of the Web Application Firewall policy"
  type        = string
}

