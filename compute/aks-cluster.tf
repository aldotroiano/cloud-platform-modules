variable "env" {
  type = string
}
variable "location" {
  type = string
}

variable "acronym" {
  type = string
}
variable "tags"{
    type = object
}

resource "azurerm_kubernetes_cluster" "kubecluster" {
  name                = "aks-cluster-${var.acronym}-${var.env}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "akscluster${var.acronym}${var.env}"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}