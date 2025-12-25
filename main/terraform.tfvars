rg_config = {
  "rg-1" = {
    rg_name = "deepak"
    rg_loc = "centralindia"
  }
  "rg-2" = {
    rg_name = "manya"
    rg_loc = "westus"
  }
}

# stg_config = {
#   "stg1" = {
#     name = "deepakstgassignment"
#     rg_name = "deepak"
#     account_tier = "Standard"
#     account_replication_type = "LRS"
#   }
#     "stg2" = {
#     name = "manyastgassignment"
#     rg_name = "manya"
#     account_tier = "Standard"
#     account_replication_type = "LRS"
#   }
# }

vnet_config = {
  "vnet1" = {
    rg_name = "deepak"
    vnet_name = "deepakvnet1"
    address_space = ["11.0.0.0/16"]
    subnet_config = [
        {
            name = "subnet1"
            address_prefixes = [ "11.0.1.0/24" ]
        },
        {
            name = "subnet2"
            address_prefixes = [ "11.0.2.0/24" ]
        }

    ]
  }
    "vnet2" = {
    rg_name = "manya"
    vnet_name = "manyavnet1"
    address_space = ["12.0.0.0/16"]
    subnet_config = [
        {
            name = "subnet1"
            address_prefixes = [ "12.0.1.0/24" ]
        },
        {
            name = "subnet2"
            address_prefixes = [ "12.0.2.0/24" ]
        }

    ]
  }
}


pip_config = {
  "pip1" = {
    rg_name = "deepak"
    name = "publicip1deepak"
  }
    "pip2" = {
    rg_name = "manya"
    name = "publicip1manya"
  }
}

net_interface_config = {
  "net_int_1" = {
      rg_name = "deepak"
      pip_name = "publicip1deepak"
      vnet_name = "deepakvnet1"
      name = "net_int_1"
      ip_config_name = "net_ip_config"
      subnet_name = "subnet1"
  }
  "net_int_2" = {
      rg_name = "manya"
      pip_name = "publicip1manya"
      vnet_name = "manyavnet1"
      name = "net_int_2"
      ip_config_name = "net_ip_config1"
      subnet_name = "subnet2"
  }
}


nsg_config = {
  nsg1 = {
    rg_name = "deepak"
    nsg_name = "deepak-nsg"
    security_rule = {
      allow-ssh = {
        rule_name = "allow-ssh"
        priority = 100
        direction = "Inbound"
        protocol = "Tcp"
      }
      allw-http = {
        rule_name = "allow-http"
        priority = 101
        direction = "Inbound"
        protocol = "Tcp"
      } 
    }
  }
}

nsg_association_config = {
  "asso-1" = {
    rg_name = "deepak"
    interface_name = "net_int_1"
    nsg_name = "deepak-nsg"
  }
}


vm_config = {
  vm1 = {
    rg_name = "deepak"
    vm_name = "deepak-vm"
    interface_name = "net_int_1"
    size = "Standard_D2a_v4"
    admin_username = "mademi"
    admin_password = "arla@1983"
    storage_account_type = "Standard_LRS"
    caching = "ReadWrite"
    publisher = "canonical"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts"
    version = "latest"
  }
}