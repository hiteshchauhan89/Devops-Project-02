=======terraform main.tf=============================


provider "aws" {
  region = "us-east-1"
  access_key = "Axxxxxxxxxx"
  secret_key = "Pxxxxxxxxxxxxxxxxxxxxxxx"
 }

variable "ami_id" {
  default = "ami-084568db4383264d4"
}

variable "instance_type_master" {
  default = "t2.medium"
}

variable "instance_type_worker" {
  default = "t2.micro"
}

variable "subnet_id" {
  default = "subnet-083f3dea30f73b6b7"
}

variable "key_name" {
  default = "docker"
}

resource "aws_security_group" "k8s_sg" {
  name        = "kubernetes-sg1"
  description = "Allow necessary Kubernetes ports"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"



--Ansible
===============Ansible Installation===============================
sudo apt update -y 
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
=================Kubernetes Installation command========================
[kuberneter master]

sudo nano script1.sh
Create the script1.sh file
#Step 2: Paste the below-given scripts here to Install the “Java” & “Jenkins”.
sudo apt-get update -y
sudo apt-get install openjdk-17-jre-headless -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y
========================================================================script 2=========================================
sudo nano script2.sh
sudo apt-get update -y
sudo apt-get install openjdk-17-jre-headless -y

sudo apt-get update -y
sudo apt install apt-transport-https curl -y


## Install containerd

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y
sudo apt-get install containerd.io -y

## Create containerd configuration

sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml

sudo sed -i -e 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml

sudo systemctl restart containerd

## Install Kubernetes

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo systemctl enable --now kubelet

## Disable swap

sudo swapoff -a
sudo modprobe br_netfilter
sudo sysctl -w net.ipv4.ip_forward=1


========================script3.sh======================================================
sudo nano script3.sh
sudo apt-get update -y
sudo apt-get install openjdk-17-jre-headless -y

sudo apt-get update -y
sudo apt install apt-transport-https curl -y

## Install containerd

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y
sudo apt-get install containerd.io -y

## Create containerd configuration

sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml

sudo sed -i -e 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml

sudo systemctl restart containerd

## Install Kubernetes

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo systemctl enable --now kubelet

## Disable swap

sudo swapoff -a
sudo modprobe br_netfilter
sudo sysctl -w net.ipv4.ip_forward=1


---
- name: install Jenkins & Java on Machine 1
  become: true
  hosts: localhost
  tasks:
  - name: running script1
    script: script1.sh

- name: install Java, Docker & Kubernetes on Machine-1
  become: true
  hosts: master
  tasks:
  - name: running script2
    script: script2.sh

- name: install Docker & Kubernetes on Machine-2&4
  become: true
  hosts: worker
  tasks:
  - name: running script3
    script: script3.sh




====================================================================================================================
sudo kubeadm join 172.31.88.162:6443 --token hygvf7.rt4tlqihkbk8k191 --discovery-token-ca-cert-hash sha256:0f83294452b21d6c4394356db458b44d833e9629dd6e4d813b99f128fe4acf22 --v=5




========
pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dbefe568-9e1e-4ab3-9d89-66aeaf7edb8c') // Replace with your credentials ID
        IMAGE_NAME = "hiteshtech003/project2"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/hiteshchauhan89/devops-project-02.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage('Login to Docker Hub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push Docker Image') {
            steps {
                sh 'docker push $IMAGE_NAME'
            }
        }
    }
}

======================Deployment.yaml=========================================
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: hiteshtech003/project2:latest
        ports:
        - containerPort: 80
========================service.yaml=====================================

apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  type: NodePort
  selector:
    app: nginx
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30008
================================================================================


pipeline {
    agent none
    environment {
        DOCKERHUB_CREDENTIALS=credentials('dbefe568-9e1e-4ab3-9d89-66aeaf7edb8c')
    }
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Git') {
            agent {
                label 'Kubernetes-Master'
            }
            steps {
                git 'https://github.com/hiteshchauhan89/devops-project-02.git'
            }
        }
        stage('Docker') {
            agent {
                label 'Kubernetes-Master'
            }
            steps {
                sh 'sudo docker build /home/ubuntu/jenkins/workspace/Testpipeline -t hiteshtech003/project2'
                sh 'sudo echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'sudo docker push hiteshtech003/project2'
            }
        }
        stage('K8s') {
            agent {
                label 'Kubernetes-Master'
            }
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}

