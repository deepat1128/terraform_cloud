
resource "azurerm_web_application_firewall_policy" "policy" {
  name                = var.waf_policy_name
  location            = var.location
  resource_group_name = var.resource_group_name

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.2"
    }
  }

  tags = var.tags
}


output "resource_id" {
  value       = azurerm_web_application_firewall_policy.policy.id
  description = "The ID of the Web Application Firewall policy"
}

