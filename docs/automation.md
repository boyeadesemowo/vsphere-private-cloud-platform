# Infrastructure Automation with Ansible

This project demonstrates how I automate the provisioning and configuration of Linux infrastructure inside my VMware vSphere homelab using **Ansible**.

The automation environment connects from a central **Control Node** (`terraform-server`) and configures multiple Linux hosts in the lab via secure SSH.

---

## 🏗️ Automation Architecture

| Component | Role | Details |
| :--- | :--- | :--- |
| **Control Node** | Manager | `terraform-server` (RHEL 9) where Ansible is installed. |
| **Managed Hosts** | Targets | RHEL 9 VMs (e.g., `tf-rhel-test-01`) deployed via Terraform/Ansible. |
| **Connectivity** | Transport | SSH Key-based authentication (Ed25519). No passwords used. |
| **Privilege Escalation** | Security | `become: yes` used for tasks requiring root access. |

---

## 📋 Inventory

Ansible uses an inventory file to define which hosts to manage. Below is an example of the static inventory used in this project:

```ini
[rhel_servers]
tf-rhel-test-01 ansible_host=192.168.1.76 ansible_user=root ansible_ssh_private_key_file=~/.ssh/id_ed25519

[all:vars]
ansible_python_interpreter=/usr/bin/python3
