# 🏗️ Enterprise vSphere Nested Homelab — Private Cloud Platform

## 📌 Overview

This project demonstrates the design, deployment, and operation of a fully self-hosted private cloud built on VMware vSphere using nested virtualization.

The environment emulates enterprise data center architecture, including:

- Clustered virtualization platform
- Centralized storage
- Virtual networking
- Automation pipelines
- Monitoring systems
- Linux server infrastructure

All components run on a single physical host, simulating a real-world enterprise environment.

The platform supports repeatable infrastructure provisioning and configuration through:

- **Infrastructure as Code (Terraform)**
- **Configuration Management (Ansible)**

This enables rapid environment rebuilds, testing, and operational experimentation.

---

## 🧠 Architecture Highlights

- VMware vSphere cluster managed by vCenter
- Nested ESXi hosts
- Shared NFS datastore
- Dedicated automation control node
- Enterprise-style virtual networking
- Monitoring and operational tooling