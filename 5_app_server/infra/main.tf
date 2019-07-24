# refer to a resource group
data "azurerm_resource_group" "rg" {
  name = "${var.resource_group}"
}

#refer to a subnet
data "azurerm_subnet" "subnet" {
  name                 = "default"
  virtual_network_name = "${var.virtual_network_name}"
  resource_group_name  = "${var.virtual_network_rg}"
}

# Create public IPs
resource "azurerm_public_ip" "pip" {
  count                        = "${var.vm_count}"
  name                         = "${var.hostname}${count.index}PublicIP"
  location                     = "${data.azurerm_resource_group.rg.location}"
  resource_group_name          = "${data.azurerm_resource_group.rg.name}"
  public_ip_address_allocation = "dynamic"
}

# create a network interface
resource "azurerm_network_interface" "nic" {
  count               = "${var.vm_count}"
  name                = "${var.hostname}${count.index}nic"
  location            = "${data.azurerm_resource_group.rg.location}"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"

  ip_configuration {
    name                          = "appconfiguration"
    subnet_id                     = "${data.azurerm_subnet.subnet.id}"
    private_ip_address_allocation = "dynamic"
  }
}

#Create disk

resource "azurerm_managed_disk" "datadisk" {
  count                = "${var.vm_count}"
  name                 = "${var.hostname}${count.index}datadisk"
  location             = "${data.azurerm_resource_group.rg.location}"
  resource_group_name  = "${data.azurerm_resource_group.rg.name}"
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "127"
}

#Create virtual machine
resource "azurerm_virtual_machine" "sapappvm" {
  name                  = "${var.hostname}${count.index}"
  location              = "${data.azurerm_resource_group.rg.location}"
  resource_group_name   = "${data.azurerm_resource_group.rg.name}"
  network_interface_ids = ["${element(azurerm_network_interface.nic.*.id,count.index)}"]
  vm_size               = "${var.vm_size}"
  count                 = "${var.vm_count}"

  storage_image_reference {
    publisher = "${var.image_publisher}"
    offer     = "${var.image_offer}"
    sku       = "${var.image_sku}"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.hostname}osdisk${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_data_disk {
    name              = "${var.hostname}${count.index}datadisk"
    managed_disk_id   = "${element(azurerm_managed_disk.datadisk.*.id,count.index)}"
    managed_disk_type = "Premium_LRS"
    disk_size_gb      = "127"
    create_option     = "Attach"
    lun               = 0
  }

  os_profile {
    computer_name  = "${var.hostname}${count.index}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = true
 
    ssh_keys {
    path     = "/home/${var.admin_username}/.ssh/authorized_keys"
    key_data = "${file("${var.sshkey_path_public}")}"
  }
 }
}
