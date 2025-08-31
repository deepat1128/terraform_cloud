resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "waf_policy" {
  source              = "Azure/avm-res-network-applicationgatewaywebapplicationfirewallpolicy/azurerm"
  version             = "0.2.0"

  name                = var.waf_policy_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
   tags = {
  environment = "dev"
  owner       = "deepa"
}

  managed_rules = {
    managed_rule_set = {
      rule_set_type = {
        type    = "OWASP"
        version = "3.2"
      }
    }
  }
}

output "waf_policy_id" {
  value = module.waf_policy.resource_id
}



