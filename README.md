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

### 1. Infrastructure Setup
- Launch EC2 instances (Ubuntu-based).
- One instance for Jenkins Master.
- Others as Kubernetes worker nodes.
- Install **Ansible** for automated configuration.
- Install **Docker** on Jenkins server.
- Install **Terraform** for IaC.

### 2. Version Control System
- GitHub repository for source code and Jenkinsfile.

### 3. Jenkins Installation & Configuration
- Install Jenkins and the **Pipeline Plugin**.
- Configure GitHub webhooks to trigger Jenkins on commits.
- Provide Docker access to Jenkins:
  ```bash
  sudo usermod -aG docker jenkins
  
### 4. Docker Setup
Install Docker on Jenkins EC2:
sudo apt update && sudo apt install docker.io -y
sudo systemctl enable docker
Confirm Docker access:
docker --version

### 5. Web Application Code Placement
Dockerfile must copy the app code to /var/www/html:

COPY . /var/www/html

### 6. Kubernetes Cluster Setup
Use kubeadm to initialize the cluster:

sudo kubeadm init --pod-network-cidr=192.168.0.0/16
Install Flannel for networking:

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
Add worker nodes using kubeadm join

# 🚀 DevOps Capstone Project - Analytics Pvt Ltd

This project is a full DevOps lifecycle implementation for a product-based organization using Docker, Jenkins, Kubernetes, Ansible, and Terraform. The goal is to automate deployment, scaling, and operation of application containers across a Kubernetes cluster, maintaining consistency with the Docker containers used in testing.

The source code used in this project is hosted at:  
👉 [https://github.com/hshar/website.git](https://github.com/hshar/website.git)

---

## 📌 Project Objective

As a DevOps engineer, you are responsible for:
- Implementing an automated CI/CD pipeline.
- Containerizing the monolithic application.
- Orchestrating containers using Kubernetes.
- Managing infrastructure as code using Terraform.
- Ensuring all setup and configuration is repeatable using Ansible.

---

## 🔁 DevOps Lifecycle Specification

1. **Git Workflow**  
   - Version control using GitHub.  
   - Releases occur **only on the 25th** of every month.

2. **Build Automation**  
   - Jenkins is triggered automatically on every `master` branch commit using webhooks.  
   - Jenkins builds the Docker image and pushes it to Docker Hub.

3. **Docker Containerization**  
   - Dockerfile is built on every push.  
   - Custom image is created with application code placed in `/var/www/html`.

4. **Kubernetes Deployment**  
   - Deploy using 2 replicas.
   - Use a **NodePort service** exposed on port `30008`.

5. **CI/CD Pipeline**  
   - Jenkins pipeline automates build, test, Docker image creation, and Kubernetes deployment.

6. **Configuration Management**  
   - Ansible automates software installation and system setup across EC2 instances.

7. **Infrastructure as Code**  
   - Terraform provisions required AWS infrastructure.

---
### 🛠 Architecture Overview
| Server  | Tools Installed          |
| ------- | ------------------------ |
| Worker1 | Jenkins, Java            |
| Worker2 | Docker, Kubernetes       |
| Worker3 | Java, Docker, Kubernetes |
| Worker4 | Docker, Kubernetes       |

