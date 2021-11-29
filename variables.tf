variable "demo-username" {
  description = "Your provided demo username"
  default     = ""
}

variable "location" {
  description = "Azure region. https://github.com/claranet/terraform-azurerm-regions/blob/master/REGIONS.md"
  default     = "westeurope"
}