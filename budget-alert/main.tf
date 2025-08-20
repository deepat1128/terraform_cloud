


data "azurerm_resource_group" "target" {
  name = var.resource_group_name
}

resource "azurerm_consumption_budget_resource_group" "vmss_budget" {
  name              = "vmss-budget"
  resource_group_id = data.azurerm_resource_group.target.id
  amount            = 500.0
  time_grain        = "Monthly"

  time_period {
    start_date = "2025-08-01T00:00:00Z"
    end_date   = "2026-08-01T00:00:00Z"
  }

  filter {
    dimension {
      name   = "ResourceType"
      values = ["Microsoft.Compute/virtualMachineScaleSets"]
    }
  }

  notification {
    enabled         = true
    operator        = "GreaterThan"
    threshold       = 90.0
    contact_emails  = ["deepaoum1128@gmail.com"]
  }
}

