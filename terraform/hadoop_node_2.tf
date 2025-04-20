resource "proxmox_lxc" "hadoop_node_2" {
  target_node  = "pve"
  vmid = 9103
  hostname     = "hadoop-node-2"
  ostemplate   = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
  password     = "P@ssw0rd"
  unprivileged = true
  start = true
  tags = "terraform;hadoop_env"
  cores = 4
  memory = 4096


  ssh_public_keys = <<-EOT
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDdAM0ttBLAxoXHpcIj27iWZ6vNBek1DKrwCiDcY80khN7NpuJZMy9Hh8EBlc/Rp1SnJWCkWGExNiJeg1KdXcTfrmcp1x+wFv5TzX4/iXcHIWCSIyCROI0kLxhqXfZAF8cQutRaZkfmZi/5fcJXR93gBzh0Wsmoab2INsEzMlbdk3UzSa5I8eoRu7fonO5KVo0xpgJnIpwD2mFdzPSWaD9k6ncmGTV6PbKm2859Y+mJ9RNOilaRuFaL/DLelPg80vVDhturuVMo6ONAS/Ow9doGLtW3YX36/Yn1S8F6BUEJjAG9uGghFIrO4AnBrkqSd22wdTZ1FdOo4rONuWWf/V64vvOqJa/SIz86hYp6e7uIukjIgc96FTp87Oj+t1RsmHmVHWc1TvB+nkLegQh/ndnGUcnfAKihYkyFHuvuuIN9YP7qBtEyqQpQ63lCztVsuHLkvpwTNkcD9L1pBS8ZTUOfSiBMsFGazIN5JYh1wrJmLj48F/pcu9yMSQmSLW3l90c= mohammed@stock-study
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCaKLllGTAElIhDZd77+InurcMYOC990I8BE+omwVxsdWGdt8p+HyJpMJNq1VzzfQxwdlH83b5pgwaoelktG7edT62kaVNDubvbO3A6spkM7BA8CHvqr3BHqskcQuv5GOSyf3mYHcYxfH/tV0P47HY1MzSXZ18eBCSywnzpdbrs7xHOLfprt6LHedfO2dnzd0e/Ln0Cq7sI6K8cvJFaR1Lz34P8OerLZPX6tj0oMyc4mpeZr7m0F/EwMqT7O3eKOo72xDTJmh+dPpa3vn/Ha7BAmRXya4Us+NDXiCO3jZhGxUZauesTyhnFF/HvOdCB0POvURIDX6QSd/K/sxh+jvzT mohammed@Mohammeds-MacBook-Pro.local
  EOT

  features {
    nesting = true
  }

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "disk-2"
    size    = "10G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip = "dhcp"
  }

    network {
    name   = "eth1"
    bridge = "vmbr2"
    ip     = "192.168.123.3/24"
    tag = 10
  }
}