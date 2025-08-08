resource "proxmox_vm_qemu" "k8s-1" {
  count        = 3
  vmid         = 500 + count.index
  name         = "k8s-2${count.index + 1}"
  target_node  = var.proxmox_node
  clone        = var.cloudinit_template_name # Cloning from VM ID 101
  full_clone   = true # Specify that it's a full clone
  agent        = 1
  os_type      = "cloud-init" # This can still be useful for cloud-init configurations

  # Network configuration
  network {
    model  = "virtio"
    bridge = "vmbr2"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  
  nameserver  = "192.168.45.146"

  sshkeys     = <<EOF
  ${var.ssh_keys}
  EOF

  # Start the VM and unlock it after creation
   provisioner "local-exec" {
    command = <<EOT
      qm unlock ${self.vmid}
      qm start ${self.vmid}
    EOT
  }
}

