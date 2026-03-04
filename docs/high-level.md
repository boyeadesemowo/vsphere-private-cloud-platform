# High-Level Architecture

This document describes the overall architecture of the **vSphere Private Cloud Platform** built in my homelab environment.

The goal of this project is to simulate a small private cloud environment that demonstrates infrastructure automation, Linux administration, and platform operations.

---

## 🏗️ Infrastructure Overview

The platform runs on a **Dell PowerEdge R630 bare-metal server** hosting a nested VMware environment. This "Lab-in-a-Box" approach allows for complex cluster testing without requiring multiple physical servers.

### Core Components
- **Hypervisor**: Nested VMware ESXi 8.0 Cluster (`CLS-NEST-01`)
- **Management**: vCenter Server Appliance (VCSA)
- **Compute**: 3x Nested ESXi Hosts
- **Storage**: Shared NFS Datastore (`NFS-DATASTORE`)
- **Control Node**: RHEL 9 Automation Server (`terraform-server`)
- **Workloads**: Red Hat Enterprise Linux 9 VMs

---

## 🏛️ Platform Architecture

The architecture follows a layered design pattern, separating concerns between physical hardware, virtualization management, and application workloads.

### 1. Physical Layer
- **Host**: Dell PowerEdge R630
- **CPU**: Dual Intel Xeon (Nested Virtualization enabled in BIOS)
- **RAM**: 128GB DDR4 (Allocated dynamically to nested VMs)
- **Storage**: Local SSDs for cache, connected to NAS for persistent storage.

### 2. Virtualization Layer
- **vCenter Server**: Centralized management plane for the nested cluster. Handles DRS, HA, and lifecycle management.
- **Nested ESXi Cluster**: Three ESXi nodes running as VMs. They believe they are running on bare metal but are actually虚拟化ized by the physical host.
  - *Benefit*: Allows testing of vMotion, HA failover, and DRS balancing safely.

### 3. Network Architecture
Traffic is segmented into logical networks to mimic enterprise security standards:

| Network Segment | Purpose | Isolation |
| :--- | :--- | :--- |
| **Management** | vCenter/ESXi Admin, SSH | VLAN 10 |
| **vMotion** | Live Migration Traffic | VLAN 20 |
| **VM Network** | Guest OS Workload Traffic | VLAN 30 |
| **Storage** | NFS Datastore Traffic | VLAN 40 |

### 4. Storage Architecture
- **Protocol**: NFS v4.1
- **Datastore**: `NFS-DATASTORE` mounted to all ESXi hosts.
- **Usage**: Stores all VM configuration files (`.vmx`) and virtual disks (`.vmdk`).
- **Advantage**: Enables shared storage features like vMotion and High Availability (HA).

### 5. Automation Layer
- **Control Node**: `terraform-server` (RHEL 9)
- **Tools**: 
  - **Terraform**: Provisioning VMs via vSphere API.
  - **Ansible**: Configuration management and OS hardening.
- **Security**: All communication secured via SSH Ed25519 keys; no password authentication allowed.

---

## 🔄 Data Flow & Workflow

1.  **Provisioning**: Terraform connects to vCenter API → Clones VM from Golden Template → Customizes Network/IP.
2.  **Configuration**: Ansible connects via SSH → Installs packages → Configures Firewall → Deploys Applications.
3.  **Monitoring**: (Future State) Prometheus scrapes metrics from ESXi/Guests → Grafana visualizes health.

---

## 🔒 Security Design

- **Network Segmentation**: Strict VLAN separation prevents lateral movement between management and workload zones.
- **Least Privilege**: Automation accounts have limited API scopes; root login restricted to key-based access only.
- **Hardening**: STIG benchmarks applied to RHEL guests via Ansible playbooks.

---

## 📸 Visual Reference

![Architecture Diagram](../screenshots/lab-overview.png)
*Overview of the nested cluster, networking, and storage layout.*

---

## 📚 Related Documentation

- [Automation Guide](./automation.md)
- [Network Setup Details](../lab/networking.md)
- [Security Hardening Standards](../operations/security.md)
