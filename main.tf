variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "jnguyen"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "app01" {
  name     = "rg-${var.project_name}-01"
  location = "West Europe"
}

resource "azurerm_service_plan" "plan01" {
  name                = "rg-${var.project_name}-01"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "webapp01" {
  name                = "app-${var.project_name}-01"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {}
}