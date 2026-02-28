# 🏗️ Enterprise vSphere Nested Homelab — Private Cloud Platform

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![Platform](https://img.shields.io/badge/platform-vSphere-blue)]()

## 📌 Overview

This project demonstrates the design, deployment, and operation of a fully self-hosted private cloud built on **VMware vSphere** using nested virtualization.

The environment emulates enterprise data center architecture, including a clustered virtualization platform, centralized storage, virtual networking, automation pipelines, monitoring systems, and Linux server infrastructure — all running on a single physical host.

The platform supports repeatable infrastructure provisioning and configuration through:
- **Infrastructure as Code (Terraform)**
- **Configuration Management (Ansible)**

This enables rapid environment rebuilds, testing, and operational experimentation in a controlled, production-like environment.

---

## 🧠 Architecture Highlights

- **VMware vSphere Cluster**: Managed centrally by vCenter Server.
- **Nested ESXi Hosts**: Multi-node cluster running inside VMs.
- **Shared Storage**: NFS datastore simulating SAN/NAS.
- **Automation Node**: Dedicated control plane for Terraform/Ansible.
- **Enterprise Networking**: Segmented networks for Management, vMotion, and Workloads.
- **Observability**: Integrated monitoring and alerting stack.

---

## 🏛️ Platform Architecture

The homelab simulates a production-style private cloud with the following layers:

### 🖥️ Infrastructure Layer
- Bare-metal server hosting the primary ESXi hypervisor.
- Nested ESXi cluster (`CLS-NEST-01`).
- vCenter Server Appliance (VCSA).
- Shared storage via NFS datastore.

### 🌐 Networking Layer
- **Management Network**: Control plane traffic.
- **vMotion Network**: Live migration traffic.
- **VM Network**: Guest workload traffic.
- **Service Networks**: Isolated segments for monitoring and automation.

### 🤖 Automation Layer
- **Terraform**: Provisioning VMs, networks, and disks via vSphere API.
- **Ansible**: Post-provisioning OS configuration and hardening.
- **VS Code Remote SSH**: Centralized development and administration.

### 📊 Operations Layer
- Monitoring and alerting (Zabbix/Prometheus).
- System administration workflows.
- Troubleshooting procedures and lifecycle management.

---

## 📸 Environment Snapshot

Below is a live view of the vCenter inventory showing the nested cluster, storage, and supporting services.

![vCenter Inventory](screenshots/vcenter-inventory.png)
*> The vSphere Client displaying the nested ESXi cluster, Zabbix monitoring server, and NFS datastore.*

*(Note: Ensure you add your actual screenshot to the `/screenshots` folder named `vcenter-inventory.png`)*

---

## ⚙️ Automation Stack

### 🟣 Terraform
Used to provision infrastructure resources declaratively via the vCenter API:
- Virtual machine deployment (CPU/RAM/Disk).
- Network interface configuration.
- Storage placement policies.
- Repeatable, version-controlled environment builds.

### 🔵 Ansible
Used for idempotent post-provisioning configuration:
- OS initialization and patching.
- Package installation (Docker, Git, etc.).
- Service management and enabling.
- Security hardening (SSH keys, firewalls).
- Application deployment.

---

## 🚀 Deployment Workflow

1.  **Prepare**: Configure underlying physical ESXi and networking.
2.  **Provision**: Run `terraform apply` to deploy nested hosts and utility VMs.
3.  **Configure**: Execute Ansible playbooks to configure OS and services.
4.  **Validate**: Verify connectivity, cluster health, and service status.
5.  **Operate**: Monitor via dashboard and perform lifecycle operations.

---

## 🧩 Platform Components

| Component | Technology | Purpose |
| :--- | :--- | :--- |
| **Hypervisor** | VMware ESXi (Nested) | Virtualization layer |
| **Management** | vCenter Server Appliance | Centralized control |
| **Storage** | NFS Datastore | Shared block/file storage |
| **OS** | Red Hat Enterprise Linux 9 | Guest operating system |
| **IaC** | Terraform | Infrastructure provisioning |
| **Config Mgmt** | Ansible | System configuration |
| **Monitoring** | Zabbix / Prometheus | Observability |
| **Editor** | VS Code Remote SSH | Development interface |

---

## 🎯 Purpose of This Project

This platform serves as a sandbox for:
- ✅ Infrastructure automation development.
- ✅ Platform engineering practice.
- ✅ Disaster recovery (DR) testing.
- ✅ Operational skill development.
- ✅ Enterprise workflow simulation.
- ✅ Certification preparation (VCP, RHCE, CKA).
- ✅ Technology experimentation without hardware costs.

---

## 🧪 Use Cases

- Testing Infrastructure-as-Code (IaC) pipelines before production rollout.
- Practicing Linux system administration at scale.
- Simulating production incidents (network partitions, host failures).
- Validating CI/CD automation pipelines.
- Learning enterprise infrastructure operations safely.

---

## 🔒 Design Goals

- **Fully Self-Hosted**: No public cloud dependencies.
- **Repeatable Builds**: Destroy and recreate the entire lab in minutes.
- **Safe Experimentation**: Isolated from production networks.
- **Production-Like**: Mirrors real-world architectural patterns.
- **Cost Efficient**: Runs on a single physical host.
- **High Educational Value**: Deep dive into virtualization internals.

---

## 📈 Skills Demonstrated

- **Virtualization Administration**: vSphere, ESXi, Nested Virtualization.
- **Infrastructure Design**: High Availability, Clustering, Storage Networks.
- **Automation Engineering**: Terraform (HCL), Ansible (YAML).
- **Linux Systems Administration**: RHEL 9, Networking, Security.
- **Networking Fundamentals**: VLANs, Subnetting, Routing.
- **Troubleshooting & Operations**: Log analysis, Performance tuning.
- **Documentation & Version Control**: Git, GitHub, Markdown.

---

## 🏆 Author

**Boye Adesemowo**  
*Linux • Cloud • DevOps • Platform Engineering*

🔗 [LinkedIn](#) | 🐙 [GitHub](https://github.com/boyeadesemowo)

---

## 📄 License

This project is for educational and demonstration purposes.  
Code samples are provided under the MIT License.

---

> 💡 **Tip**: To get started, clone this repo on your automation node, configure your `terraform.tfvars` with vCenter credentials, and run `terraform init && terraform apply`.