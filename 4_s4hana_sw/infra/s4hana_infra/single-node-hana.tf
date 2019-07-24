# Configure the Microsoft Azure Provider
provider "azurerm" {}

#refer to resource az_resource_group
data "azurerm_resource_group" "s4hana" {
  name = "${var.az_resource_group}"
}

#refer to a subnet
data "azurerm_subnet" "s4hana" {
   resource_group_name  = "${var.net_rg_name}"
   virtual_network_name = "${var.vnet_name}"
   name                 = "${var.subnet_name}"
}

module "create_hdb" {
  source = "../create_hdb_node"
  az_resource_group         = "${data.azurerm_resource_group.s4hana.name}"
  az_region                 = "${var.az_region}"
  vm_name                   = "${var.vm_name}"
  az_domain_name            = "${var.az_domain_name}"
  hana_subnet_id            = "${data.azurerm_subnet.s4hana.id}"
  private_ip_address        = "${var.private_ip_address_hdb}"
  public_ip_allocation_type = "${var.public_ip_allocation_type}"
  sap_sid                   = "${var.sap_sid}"
  sshkey_path_public        = "${var.sshkey_path_public}"
  storage_disk_sizes_gb     = "${var.storage_disk_sizes_gb}"
  vm_user                   = "${var.vm_user}"
  vm_size                   = "${var.vm_size}"
}

