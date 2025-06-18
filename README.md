# 🚀 DevOps Capstone Project 

Welcome to the DevOps Capstone Project for , a product-based organization rapidly scaling its infrastructure. The goal of this project is to automate the **deployment, scaling, and operations** of containerized applications using a robust DevOps lifecycle and modern cloud-native tools.

---

## 📦 Project Overview

The final product gained significant traction post-launch. With increasing demand, the company is transitioning from a **monolithic architecture** to a **containerized microservices-based deployment** using **Docker**, **Kubernetes**, and **AWS Cloud** for scalability and automation.

📂 Product Source Code: [https://github.com/hiteshchauhan89/Devops-Project-02.git](https://github.com/hiteshchauhan89/Devops-Project-02.git))

---

## 🎯 Objectives

- Implement a complete DevOps lifecycle to automate:
  - Version Control and Release Management
  - Docker-based Containerization
  - Kubernetes-based Orchestration
  - Jenkins CI/CD Pipeline
  - Infrastructure provisioning using Terraform
  - Configuration management via Ansible

---

## 🔁 DevOps Lifecycle Implementation

| Component | Description |
|----------|-------------|
| **1. Git Workflow** | Monolithic Git strategy with monthly releases on **25th** |
| **2. CI/CD with Jenkins** | Jenkins pipeline triggers build on commits to `master` |
| **3. Docker** | Docker image built and pushed on each GitHub commit |
| **4. Kubernetes** | Deployed with **2 replicas**, using **NodePort** on `30008` |
| **5. Terraform** | Infrastructure provisioning on AWS Cloud |
| **6. Ansible** | Configuration management and software installation |

---

## 🛠️ Prerequisites

### ✅ Infrastructure Setup

- EC2 instance for Jenkins
- Configuration Management: **Ansible**
- Installed:
  - Jenkins
  - Docker
  - Terraform
  - kubectl

### ✅ Jenkins Configuration

- Install Plugins:
  - **Pipeline Plugin**
- Connect GitHub with Webhooks to trigger on `master` commits

### ✅ Docker Configuration

- Build image from Dockerfile
- Push to **Docker Hub**
- Run app at: `/var/www/html` inside container

### ✅ Kubernetes Setup

- Use a cluster with:
  - **2 replicas**
  - NodePort service on **port 30008**
- Deploy from Docker Hub image

---

## 📁 Project Structure

├── Dockerfile
├── Jenkinsfile
├── k8s/
│ ├── deployment.yaml
│ └── service.yaml
├── terraform/
│ ├── main.tf
├── ansible/
│ ├── install_jenkins.yml
│ ├── install_docker.yml
│ └── install_kubernetes.yml
└── README.md
