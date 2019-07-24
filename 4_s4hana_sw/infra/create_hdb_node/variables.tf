variable "availability_set_id" {
  description = "The id associated with the availability set to put this VM into."
  default     = ""                                                                 # Empty string denotes that this VM is not in an availability set.
}

variable "az_domain_name" {
  description = "Prefix to be used in the domain name"
}

variable "az_region" {}

variable "az_resource_group" {
  description = "Which Azure resource group to deploy the HANA setup into.  i.e. <myResourceGroup>"
}

variable "backend_ip_pool_ids" {
  type        = "list"
  description = "The ids that associate the load balancer's back end IP pool with this VM's NIC."
  default     = []
}

variable "hana_subnet_id" {
  description = "The HANA specific subnet that this node needs to be on."
}

variable "private_ip_address" {
  description = "The desired private IP address of this NIC.  If it isn't specified, a dynamic IP will be allocated."
  default     = ""
}

variable "public_ip_allocation_type" {
  description = "Defines whether the IP address is static or dynamic. Options are Static or Dynamic."
}

variable "sap_sid" {
  default = "PV1"
}

variable "sshkey_path_public" {
  description = "The path on the local machine to where the public key is"
}

variable "storage_disk_sizes_gb" {
  type        = "list"
  description = "List disk sizes in GB for all disks this VM will need"
}

variable "vm_name" {
  description = "Name of the VM"
}

variable "vm_size" {
  default = "Standard_E8s_v3"
}

variable "vm_user" {
  description = "The username of your HANA database VM."
}


