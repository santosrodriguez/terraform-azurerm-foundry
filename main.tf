terraform {
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
  }
}

resource "azurerm_ai_services" "ai-services" {
  name                = "aif-${var.solution_name}-${var.location}-${var.environment}-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "S0"
  public_network_access = "Disabled"
}

resource "azurerm_ai_foundry" "aif-example" {
  name                = "aif-${var.solution_name}-${var.location}-${var.environment}-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  storage_account_id  = var.storage_account_id
  key_vault_id        = var.key_vault_id
  public_network_access = "Disabled"

  identity {
    type = "SystemAssigned"
  }
}
