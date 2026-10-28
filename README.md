# Azure AI Foundry Terraform Module

## Introduction
Terraform module to deploy an Azure AI Foundry resource and a companion Azure AI Services account, using a standardized naming convention and system-assigned managed identity.

## Usage

```hcl
module "ai_foundry" {
	source              = "caresource.pe.jfrog.io/shared-tfmodules-internal__ai/aifoundry/azurerm"
	version             = "1.0.0"

	resource_group_name = "rg-project-eastus2-dev-01"
	location            = "eastus2"
	solution_name       = "project"
	environment         = "dev"

	key_vault_id        = azurerm_key_vault.example.id
	storage_account_id  = azurerm_storage_account.example.id
}
```

This will create AI Services and AI Foundry resources with names in the format:

`aif-<solution_name>-<location>-<environment>-01`

## Inputs

| Name                | Type   | Description                                                              | Default    |
|---------------------|--------|--------------------------------------------------------------------------|------------|
| resource_group_name | string | Name of the existing resource group in which to create AI resources.    | n/a        |
| key_vault_id        | string | ID of the Key Vault to be used by AI Foundry.                           | n/a        |
| storage_account_id  | string | ID of the Storage Account to be used by AI Foundry.                     | n/a        |
| location            | string | Azure region where AI Foundry and AI Services will be created.          | "eastus2" |
| solution_name       | string | Name of the solution or project used in the resource names.             | n/a        |
| environment         | string | Environment identifier (e.g. dev, int, prd).                            | n/a        |

## Outputs

| Name             | Description                             |
|------------------|-----------------------------------------|
| ai_services_name | Name of the AI Services resource        |
| ai_foundry_name  | Name of the AI Foundry resource         |
| ai_foundry_id    | Resource ID of the AI Foundry resource  |

## Features

- Deploys an Azure AI Foundry workspace and associated AI Services account.
- Enforces a consistent naming convention across environments.
- Configures a system-assigned managed identity for AI Foundry.
- Integrates with existing Key Vault and Storage Account resources.

## Requirements

- Terraform >= 1.4.0
- AzureRM provider >= 3.0
- Azure CAF provider (aztfmod/azurecaf)
