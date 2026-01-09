resource_groups = {
  rg1 = {
  name     = "sazsatyaprakash-rg"
  location = "West Europe"
  }

  #   rg2 = {
  # name     = "sazsatyaprakash-rg2"
  # location = "West Europe"
  # }

      rg3 = {
  name     = "sazsatyaprakash-rg3"
  location = "West Europe"
  }

}


container_registries = {
  acr1 = {
    name                = "sazsatyaprakashacr"
    resource_group_name = "sazsatyaprakash-rg"
    location            = "West Europe"
    sku                 = "Standard"
  }
}

public_ips = {
  pip1 = {
    name                = "sazsatyaprakash-pip"
    resource_group_name = "sazsatyaprakash-rg"
    location            = "West Europe"
    allocation_method   = "Static"
  }
}

virtual_networks = {
  vnet1 = {
    name                = "sazsatyaprakash-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = "West Europe"
    resource_group_name = "sazsatyaprakash-rg"
    subnets = {
      subnet1 = {
        name             = "sazsatyaprakash-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        name             = "sazsatyaprakash-appgwsubnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

application_gateways = {
  appgw1 = {
    name                = "sazsatyaprakash-appgw"
    resource_group_name = "sazsatyaprakash-rg"
    location            = "West Europe"
    sku = {
      name     = "Standard_v2"
      tier     = "Standard_v2"
      capacity = 2
    }

    gateway_ip_configuration = {
      name        = "appgw-ipconfig"
      subnet_name = "sazsatyaprakash-appgwsubnet"
    }

    virtual_network_name = "sazsatyaprakash-vnet"
    public_ip_name       = "sazsatyaprakash-pip"
    frontend_ports = {
      port1 = {
        name = "frontendPort1"
        port = 80
      }
    }
    frontend_ip_configurations = {
      config1 = {
        name = "frontendIPConfig1"
      }
    }
    backend_address_pools = {
      pool1 = {
        name = "backendPool1"
      }
    }
    backend_http_settings = {
      setting1 = {
        name                  = "httpSetting1"
        cookie_based_affinity = "Disabled"
        path                  = "/"
        port                  = 80
        protocol              = "Http"
        request_timeout       = 60
      }
    }
    http_listeners = {
      listener1 = {
        name                           = "httpListener1"
        frontend_ip_configuration_name = "frontendIPConfig1"
        frontend_port_name             = "frontendPort1"
        protocol                       = "Http"
      }
    }
    request_routing_rules = {
      rule1 = {
        name                       = "rule1"
        priority                   = 9
        rule_type                  = "Basic"
        http_listener_name         = "httpListener1"
        backend_address_pool_name  = "backendPool1"
        backend_http_settings_name = "httpSetting1"
      }
    }
  }
}


kubernetes_clusters = {
  aks1 = {
    ingress_application_gateway_name = "sazsatyaprakash-appgw"
    resource_group_name              = "sazsatyaprakash-rg"
    container_registry_name         = "sazsatyaprakashacr"
    acr_pull_role_name               = "AcrPull"
    skip_aad_check                   = true
    name                             = "sazsatyaprakash-aks"
    location                         = "West Europe"
    dns_prefix                       = "sazsatyaprakash-aksdnsprefix"
    kubernetes_version               = "1.32.5"
    default_node_pool = {
      name                 = "default"
      node_count           = 1
      vm_size              = "Standard_D8ds_v5"
      max_pods             = 80
      auto_scaling_enabled = true
      min_count            = 1
      max_count            = 2
    }
    identity = {
      type = "SystemAssigned"
    }
    network_profile = {
      network_plugin = "azure"
      network_policy = "azure"
    }
  }
}

mssql_servers = {
  mssql1 = {
    name                         = "sazsatyaprakash-aksdnsprefixmssqlserver007"
    resource_group_name          = "sazsatyaprakash-rg"
    location                     = "West Europe"
    version                      = "12.0"
    administrator_login          = "aksclustersjs"
    administrator_login_password = "neton@!#5657558"
  }
}

mssql_databases = {
  mysqldb1 = {
    name           = "sazsatyaprakash-aksdnsprefixmssqldb007"
    resource_group_name = "sazsatyaprakash-rg"
    server_name    = "sazsatyaprakash-aksdnsprefixmssqlserver007"
    collation      = "SQL_Latin1_General_CP1_CI_AS"
    license_type   = "LicenseIncluded"
    max_size_gb   = 2
    sku_name      = "S0"
    enclave_type  = "VBS"
  }

}




