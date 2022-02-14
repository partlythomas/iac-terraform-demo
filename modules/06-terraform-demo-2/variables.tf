variable "demo-username" {
  description = "Your provided demo username (without @example.domain. Example: demo-jdf24)"
}

variable "location" {
  description = "Azure region. https://github.com/claranet/terraform-azurerm-regions/blob/master/REGIONS.md"
  default     = "westeurope"
}