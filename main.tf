resource "azurerm_resource_group" "rg" {
  name     = "rg-cr460-mahdi"
  location = "canada central"
}

resource "azurerm_container_group" "aci" {
  name                = "aci-cr460-mahdi"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "Public"
  dns_name_label      = "acimahdicr460"
  os_type             = "Linux"

  container {
    name   = "nginx"
    image  = "nginx:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  exposed_port {
    port     = 80
    protocol = "TCP"
  }
}