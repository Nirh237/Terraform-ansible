# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  features {}
}


module "network" {
   source = "./modules/network"

   resource_group_name = var.resource_group_name
   location            = var.location
   vnet                = var.vnet


}

module "compute" {
    source = "./modules/compute/linuxVM"

   name                          = var.linuxVMName_stage[0]
   resource_group_name           = module.network.resource_group_name
   location                      = module.network.location
   vnet                          = [module.network.vnet]
   admin_username                = var.admin_username
   admin_password                = var.admin_password
   vm_size                       = var.vm_size
   network_interface_ids         = [module.network.network_interface_ids_public_linuxMaster]
   availability_set_id           = module.network.availability_set_public
   computer_name                 = var.linuxVMName_stage[0]
}


module "compute1" {
   source = "./modules/compute/linuxVM"

   name                          = var.linuxVMName_stage[1]
   resource_group_name           = module.network.resource_group_name
   location                      = module.network.location
   vnet                          = [module.network.vnet]
   admin_username                = var.admin_username
   admin_password                = var.admin_password
   vm_size                       = var.vm_size
   network_interface_ids         = [module.network.network_interface_ids_public_linuxCI-CD]
   availability_set_id           = module.network.availability_set_public
   computer_name                 = var.linuxVMName_stage[1]
}




module "compute5" {
   source = "./modules/compute/linuxVM"

   name                          = var.linuxVMName_prod[0]
   resource_group_name           = module.network.resource_group_name
   location                      = module.network.location
   vnet                          = [module.network.vnet]
   admin_username                = var.admin_username
   admin_password                = var.admin_password
   vm_size                       = var.vm_size
   network_interface_ids         = [module.network.network_interface_ids_public_linuxVM3]
   availability_set_id           = module.network.availability_set_public
   computer_name                 = var.linuxVMName_prod[0]
}

module "compute6" {
   source = "./modules/compute/linuxVM"

   name                          = var.linuxVMName_prod[1]
   resource_group_name           = module.network.resource_group_name
   location                      = module.network.location
   vnet                          = [module.network.vnet]
   admin_username                = var.admin_username
   admin_password                = var.admin_password
   vm_size                       = var.vm_size
   network_interface_ids         = [module.network.network_interface_ids_public_linuxVM4]
   availability_set_id           = module.network.availability_set_public
   computer_name                 = var.linuxVMName_prod[1]
}

module "compute7" {
   source = "./modules/compute/linuxVM"

   name                          = var.linuxVMName_prod[2]
   resource_group_name           = module.network.resource_group_name
   location                      = module.network.location
   vnet                          = [module.network.vnet]
   admin_username                = var.admin_username
   admin_password                = var.admin_password
   vm_size                       = var.vm_size
   network_interface_ids         = [module.network.network_interface_ids_private_DB]
   availability_set_id           = module.network.availability_set_private
   computer_name                 = var.linuxVMName_prod[2]
 

}