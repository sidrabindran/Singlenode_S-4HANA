# Azure region to deploy resource in; please choose the same region as your storage from step 3 (example: "westus2")
resource_group  = "s4hana"

# Name of resource group to deploy (example: "demo1")
location = "eastus2"

# For HANA platform edition, a minimum of 32 GB of RAM is recommended
vm_size = "Standard_D8s_v3"

# OS user with sudo privileges to be deployed on VM (e.g. "demo")
admin_username = "demo"

virtual_network_name = "Sid_East2_VNET"

subnet_name = "default"

virtual_network_rg = "East2_VNET"

vm_count = 2  

hostname = "sapapp"

# Path to the public SSH key to be used for authentication (e.g. "~/.ssh/id_rsa.pub")
sshkey_path_public = "~/.ssh/id_rsa.pub"

# Path to the corresponding private SSH key (e.g. "~/.ssh/id_rsa")
sshkey_path_private = "~/.ssh/id_rsa"
