# 🏗️ Enterprise vSphere Nested Homelab — Private Cloud Platform

![Ansible](https://img.shields.io/badge/Ansible-2.14-red?style=for-the-badge&logo=ansible) ![vSphere](https://img.shields.io/badge/VMware%20vSphere-8.0-blue?style=for-the-badge&logo=vmware) ![RHEL](https://img.shields.io/badge/RHEL-9-red?style=for-the-badge&logo=redhat)

## 📌 Overview

This project demonstrates the design, deployment, and operation of a fully self-hosted private cloud built on VMware vSphere using nested virtualization.

The environment emulates an enterprise data center architecture. The primary automation pipeline is driven by **Ansible**, chosen for its robust and reliable vSphere integration after a critical bug was discovered in the legacy Terraform provider.

This repository showcases a real-world engineering journey: encountering a tool-related blocker, diagnosing the root cause, and executing a strategic pivot to a more suitable technology to ensure project success.

---

## 🏛️ Platform Architecture

The homelab simulates a production-style private cloud with the following layers:

*   **🖥️ Infrastructure Layer:** Nested ESXi cluster, vCenter Server, and shared NFS storage.
*   **🌐 Networking Layer:** Segmented networks for Management, vMotion, and VM Workloads.
*   **🤖 Automation Layer:** An Ansible control node responsible for all provisioning and configuration tasks.
*   **📊 Operations Layer:** Future home for monitoring, logging, and lifecycle management tools.

*(Placeholder: Add your `screenshots/lab-architecture.png` here)*

---

## ⚙️ The Automation Stack: A Tale of Two Tools

### Phase 1: The Terraform Attempt & The Bug

The initial approach utilized Terraform with the legacy `vmware/vsphere v2.15.0` provider. This effort was consistently blocked by a critical, unfixable bug in the provider's template cloning functionality.

*   **The Bug:** When cloning a VM from a valid template, the provider would discard the template's bootable OS disk and attach a new, empty disk, resulting in every deployed VM failing with an `Operating System not found` error.
*   **The Diagnosis:** After proving the template was perfect via manual vCenter clones, the issue was definitively isolated to the Terraform provider itself. The `terraform/` directory in this repository is kept as a historical record of this troubleshooting process.

### Phase 2: The Ansible Solution (The Successful Path)

To overcome the blocker, the workflow was migrated to **Ansible**.

Ansible's `community.vmware.vmware_guest` module proved to be mature, stable, and reliable. It handles template cloning (using a `linked_clone: false` full clone) and guest OS customization without issue, successfully deploying a bootable RHEL 9 VM every time.

---

## 🚀 Deployment Workflow

The entire deployment is now handled by a single Ansible command.

### How to Run
1.  **Clone this repository** onto your Ansible control node.
2.  **Navigate to the Ansible directory:** `cd automation/ansible`.
3.  **Install the VMware collection:** `ansible-galaxy collection install -r requirements.yml`.
4.  **Update variables** in `group_vars/all/main.yml`.
5.  **Create an encrypted vault** for your vCenter password: `ansible-vault create group_vars/all/vault.yml`. Add `vcenter_password: "YourPassword"` to the file.
6.  **Execute the playbook:**
    ```bash
    ansible-playbook playbooks/deploy_vm.yml --ask-vault-pass
    ```

---

## 📈 Skills Demonstrated

*   **Virtualization Administration:** vSphere, ESXi, Nested Virtualization.
*   **Automation Engineering:** **Ansible (YAML)**, Terraform (HCL).
*   **Advanced Troubleshooting:** Diagnosing and isolating bugs in third-party providers.
*   **Strategic Tool Selection:** Migrating from a failing tool to a reliable solution.
*   **Linux Systems Administration:** RHEL 9, Networking, Security.
*   **Version Control:** Git, GitHub, Professional Documentation.

---

## 🏆 Author

**Boye Adesemowo**
*Linux • Cloud • DevOps • Platform Engineering*

[🔗 LinkedIn](https://www.linkedin.com/in/boyeadesemowo/) | [🐙 GitHub](https://github.com/boyeadesemowo)
