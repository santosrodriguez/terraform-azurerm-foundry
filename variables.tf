variable "resource_group_name" {
  description = "The name of the resource group in which to create the AI Foundry."
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the Key Vault to be used by the AI Foundry."
  type        = string
}

variable "storage_account_id" {
  description = "The ID of the Storage Account to be used by the AI Foundry."
  type        = string
}

variable "location" {
  description = "The Azure location where the AI Foundry will be created."
  type        = string
  default     = "eastus2"
}

variable "solution_name" {
  description = "The name of the solution for naming resources."
  type        = string
}

variable "environment" {
  description = "The environment for the AI Foundry."
  type        = string
}
