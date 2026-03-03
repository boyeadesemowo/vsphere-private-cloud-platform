# vSphere Private Cloud Platform

![Lab Overview](screenshots/lab-overview.png)

A fully automated **Nested ESXi Lab** built on VMware vSphere.

---

## 📋 Project Overview

This project demonstrates the design, deployment, and operation of a self-hosted private cloud using nested virtualization on VMware vSphere.

The environment emulates enterprise data center architecture, including a clustered hypervisor, centralized storage, virtual networking, automation pipelines, and Linux server infrastructure — all running on a single physical host.

---

## 🏛️ Architecture & Components

- **Hypervisor Layer**: Nested ESXi cluster (`CLS-NEST-01`)
- **Management Layer**: vCenter Server Appliance
- **Storage Layer**: NFS Datastore (`NFS-DATASTORE`)
- **Networking Layer**: Segmented networks (Management, vMotion, VM Network)
- **Automation Layer**: Dedicated control node running Terraform and Ansible
- **Guest OS**: Red Hat Enterprise Linux 9

**Screenshot**: [vCenter Inventory](screenshots/vcenter-inventory.png)

---

## ⚙️ Automation Stack

**Terraform** (Initial Approach)  
Used for infrastructure provisioning via the vSphere API. However, a critical bug in the legacy `vmware/vsphere` v2.15 provider prevented reliable template cloning (VMs repeatedly booted with "Operating System not found").

**Ansible** (Successful Path)  
Migrated to Ansible's `community.vmware.vmware_guest` module, which proved stable and reliable for full template cloning and VM deployment.

This repository preserves the full journey — from encountering the blocker to successfully pivoting to a working solution.

---

## 🚀 Execution Workflow

1. **Preparation**: Configured physical ESXi host and networking for nesting
2. **Provisioning**: Used Ansible to deploy VMs from template
3. **Configuration**: Applied Cloud-Init and Ansible playbooks for OS hardening and package installation
4. **Validation**: Verified VM boot, networking, and functionality in vCenter

---

## 🛠️ Challenges & Solutions

**Challenge**: Terraform template cloning bug  
**Solution**: Diagnosed that the provider was replacing the bootable OS disk with an empty one. Pivoted to Ansible for reliable deployment.

**Challenge**: Legacy guest customization timeouts on RHEL 9  
**Solution**: Installed Cloud-Init + VMware guestinfo datasource in the golden template for modern, reliable first-boot configuration.

---

## 📸 Screenshots

- [vCenter Inventory](screenshots/vcenter-inventory.png)
- [Deployed VM Console](screenshots/rhel9-console.png)
- [Ansible Playbook Execution](screenshots/ansible-run.png)

---

## 🛠️ Tech Stack

- Terraform
- Ansible + Cloud-Init
- VMware vSphere (Nested ESXi)
- Red Hat Enterprise Linux 9

---

## 📚 Documentation

- [High-Level Architecture](docs/high-level.md)
- [Automation Guide](docs/automation.md)
- [Nested ESXi Lab Setup](lab/nested-esxi/)

---

**Built as a learning project to showcase real-world infrastructure automation and problem-solving.**

*Last updated: March 2025*

---

**Author:** Boye Adesemowo  
**Focus:** Linux • Cloud • DevOps • Platform Engineering
