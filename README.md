# 🏗️ vSphere Private Cloud Platform

![Lab Overview](screenshots/lab-overview.png)

A fully automated **Nested ESXi Lab** built on VMware vSphere using Terraform and Ansible.

---

## 📋 Project Overview

This project demonstrates how to build and manage a self-hosted private cloud using nested virtualization on VMware vSphere.

The environment emulates enterprise data center architecture, including a clustered hypervisor, centralized storage, automation pipelines, and monitoring — all running on a single physical host.

---

## 🛠️ Tech Stack

![Ansible](https://img.shields.io/badge/Ansible-2.14-red?style=for-the-badge&logo=ansible)
![VMware vSphere](https://img.shields.io/badge/VMware%20vSphere-8.0-blue?style=for-the-badge&logo=vmware)
![RHEL](https://img.shields.io/badge/RHEL-9-red?style=for-the-badge&logo=redhat)
![Terraform](https://img.shields.io/badge/Terraform-1.14-blue?style=for-the-badge&logo=terraform)

---

## 📁 Repository Structure

```bash
vsphere-private-cloud-platform/
├── automation/
│   ├── terraform/     # VM provisioning
│   └── ansible/       # OS & application configuration
├── docs/              # Architecture & guides
├── lab/               # Nested ESXi lab documentation
├── operations/        # Monitoring & operations
├── screenshots/       # Visual documentation
├── README.md
└── .gitignore

✨ Key Features

    Automated VM deployment from golden templates
    Secure first-boot configuration with Cloud-Init
    Idempotent configuration using Ansible
    Repeatable and version-controlled infrastructure

🚀 Quick Start

Bash

# 1. Deploy VM
cd automation/terraform
terraform init
terraform apply

# 2. Configure VM
cd ../ansible
ansible-playbook playbooks/deploy.yml

📸 Screenshots

vCenter Inventory
RHEL 9 Console

Built as a learning project to showcase real-world infrastructure automation.

Last updated: March 2025

Author: Boye Adesemowo
Focus: Linux • Cloud • DevOps • Platform Engineering
