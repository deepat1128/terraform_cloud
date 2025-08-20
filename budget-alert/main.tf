


data "azurerm_resource_group" "vmss_rg" {
  name = var.resource_group_name
}

resource "azurerm_consumption_budget_resource_group" "vmss_budget" {
  name              = "vmss-budget-alert"
  resource_group_id = data.azurerm_resource_group.vmss_rg.id
  amount            = 500.0
  time_grain        = "Monthly"

  time_period {
    start_date = "2025-08-01"
    end_date   = "2026-08-01"
  }

  notification {
    enabled        = true
    threshold      = 80.0
    operator       = "GreaterThan"
    contact_emails = ["deepaoum1128@gmail.com"]
  }

  notification {
    enabled        = true
    threshold      = 100.0
    operator       = "GreaterThan"
    contact_emails = ["deepaoum1128@gmail.com"]
  }
}
