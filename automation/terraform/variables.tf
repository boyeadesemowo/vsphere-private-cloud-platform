# ===================================================================
#  vCenter Connection Variables
# ===================================================================

variable "vsphere_user" {
  type        = string
  description = "The username for vCenter."
}

variable "vsphere_password" {
  type        = string
  description = "The password for vCenter."
  sensitive   = true
}

variable "vsphere_server" {
  type        = string
  description = "The FQDN or IP address of the vCenter Server."
}

# ===================================================================
#  vSphere Environment Variables
# ===================================================================

variable "vsphere_datacenter" {
  type        = string
  description = "The name of the vSphere Datacenter."
}

variable "vsphere_cluster" {
  type        = string
  description = "The name of the vSphere Cluster."
}

variable "vsphere_datastore" {
  type        = string
  description = "The name of the Datastore to deploy the VM to."
}

variable "vsphere_network" {
  type        = string
  description = "The name of the vSphere Port Group for the VM."
}

# ===================================================================
#  New Virtual Machine Configuration Variables
# ===================================================================

variable "vm_template_name" {
  type        = string
  description = "The name of the VM template to clone from (e.g., rhel9-golden)."
}

variable "new_vm_name" {
  type        = string
  description = "The desired hostname for the new virtual machine."
}

variable "vm_domain" {
  type        = string
  description = "The domain name for the new VM (e.g., lab.local)."
}

variable "vm_ipv4_gateway" {
  type        = string
  description = "The IPv4 gateway for the VM's network."
}

variable "vm_dns_servers" {
  type        = list(string)
  description = "A list of DNS servers for the VM."
}

variable "allow_unverified_ssl" {
  type        = bool
  description = "Set to true to allow connecting to a vCenter with a self-signed certificate."
  default     = true
}