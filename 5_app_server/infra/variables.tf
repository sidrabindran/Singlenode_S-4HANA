variable "resource_group" {
  description = "The name of the resource group in which to create the virtual network."
  default     = "SAP_Terraform_Test"
}

variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
  default     = "westus2"
}

variable "virtual_network_name" {
  description = "The name for the virtual network."
  default     = "vnet"
}

variable "subnet_name" {
  description = "The name for the virtual network."
  default     = "subnet"
}

variable "virtual_network_rg" {
  description = "resource group where Virtual Network is deployed"
  default     = "vnet_rg"
}

variable "datadisk_size" {
  description = "defines size of hana data disk"
  default     = "127"
}

variable "vm_count" {
  description = "No of HANA VM's required as a part of the group"
  default     = 1
}

variable "vm_size" {
  description = "Size of the VM to be deployed"
  default     = "Standard_D8s_v3"
}

variable "hostname" {
  description = "VM name referenced also in storage-related names."
  default     = "saphana"
}

variable "image_publisher" {
  description = "name of the publisher of the image (az vm image list)"
  default     = "SUSE"
}

variable "image_offer" {
  description = "the name of the offer (az vm image list)"
  default     = "SLES-SAP"
}

variable "image_sku" {
  description = "image sku to apply (az vm image list)"
  default     = "12-SP3"
}

variable "image_version" {
  description = "version of the image to apply (az vm image list)"
  default     = "latest"
}

variable "admin_username" {
  description = "administrator user name"
  default     = "vmadmin"
}

variable "admin_password" {
  description = ""
  default     = "MAGA@12345678"
}

variable "sshkey_path_private" {
  description = "The path on the local machine to where the private key is"
}

variable "sshkey_path_public" {
  description = "The path on the local machine to where the public key is"
}
