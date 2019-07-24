# Azure region to deploy resource in; please choose the same region as your storage from step 3 (example: "westus2")
az_region = "eastus2"

# Name of resource group to deploy (example: "demo1")
az_resource_group = "s4_test_deploy"

# Unique domain name for easy VM access (example: "hana-on-azure1")
az_domain_name = "hana-on-azure"

# Size of the VM to be deployed (example: "Standard_E8s_v3")
# For HANA platform edition, a minimum of 32 GB of RAM is recommended
vm_size = "Standard_E8s_v3"

# Path to the public SSH key to be used for authentication (e.g. "~/.ssh/id_rsa.pub")
sshkey_path_public = "~/.ssh/id_rsa.pub"

# Path to the corresponding private SSH key (e.g. "~/.ssh/id_rsa")
sshkey_path_private = "~/.ssh/id_rsa"

# OS user with sudo privileges to be deployed on VM (e.g. "demo")
vm_user = "demo"

# private IP address
private_ip_address_hdb = "10.2.0.20"

# Name of the VM
vm_name = "hanadb"

# SAP system ID (SID) to be used for HANA installation (example: "HN1")
sap_sid = "HN1"

# Resource group where Virtual Network in deployed
net_rg_name = "s4_test_deploy"

# Name of the Virtual network where the VM's will be deployed
vnet_name = "sapvnet"

# Name of the subnet where SAP will be deployed
subnet_name = "default"
