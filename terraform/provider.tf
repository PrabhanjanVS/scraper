variable "pm_api_url" {
  type = string
}

variable "cloudinit_template_name"{
  type = string
}



variable "ssh_keys" {
  type      = string
  sensitive = true
}


variable "proxmox_node" {
  type = string
}

variable "ssh_key" {
  type      = string
  sensitive = true
}

variable "username" {
  type = string
}

provider "proxmox" {
  pm_api_url = var.pm_api_url
  #pm_user    = var.username  
}
terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}
