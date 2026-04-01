# 🚀 Next-Gen Banking Platform with Local LLM Integration
---

## 🧠 Project Summary

A **production-style, end-to-end DevOps implementation** of a cloud-native banking platform, designed to simulate real-world deployment pipelines used in modern enterprises.

This project demonstrates:

* Full CI/CD automation
* Infrastructure provisioning using Terraform
* Kubernetes-based microservice deployment
* Secure and scalable architecture design

---

## ⚡ Quick Start (Run in <5 Minutes)

```bash
# Clone repository
git clone https://github.com/Sachin8801/AI-BankApp-DevOps.git
cd AI-BankApp-DevOps

# Build and run locally
docker-compose up --build

# OR deploy to Kubernetes
kubectl apply -f k8s/dev/
```

📌 Access:

```
http://<EC2-Public-IP>:30007
```

---

## 🏗️ Architecture Overview

### 🔹 System Design

* **Frontend + Backend** → Spring Boot (Containerized)
* **Database** → MySQL (Persistent storage)
* **Orchestration** → Kubernetes (K3s lightweight cluster)
* **CI/CD** → GitHub Actions
* **Infrastructure** → Terraform (AWS EC2)

---

## 📊 Architecture Diagram

<img width="1083" height="723" alt="image" src="https://github.com/user-attachments/assets/732682f0-e09b-4890-b77c-d0003a1bc02a" />


---

## 🔄 CI/CD Pipeline (Automated Workflow)

```text
Code Push → Build → Test → Security Scan → Docker Build → Push → Infra Provision → K8s Deploy
```

### Pipeline Stages:

1. Maven Build & Unit Testing
2. Docker Image Build & Tagging (`github.sha`)
3. Image Push to Docker Hub
4. Terraform Execution (Provision EC2 + Networking)
5. K3s Cluster Setup
6. Kubernetes Deployment
7. Service Exposure (NodePort)

---

## ☁️ Infrastructure as Code (Terraform)

Provisioned Resources:

* EC2 Instance (K3s Node)
* Security Groups:

  * SSH (22)
  * Kubernetes API (6443)
  * Application Port (30007)
* Elastic IP for stable access

---

## ☸️ Kubernetes Deployment

* Namespace isolation: `bank-app`
* ConfigMap & Secrets management
* MySQL Deployment + Service
* Application Deployment + Service
* NodePort exposure

---

## 🔐 Security Implementation

* Image vulnerability scanning using **Trivy**
* Secrets handled via Kubernetes Secrets
* Network access restricted via AWS Security Groups

---

## 📈 Scalability & Production Considerations

* Designed for horizontal scaling via Kubernetes
* Supports future integration with:

  * HPA (Horizontal Pod Autoscaler)
  * Ingress Controller (NGINX)
  * Monitoring stack (Prometheus + Grafana)

---

## ⚠️ Challenges & Engineering Fixes

### 🔴 ImagePullBackOff

* Root Cause: Image tag mismatch
* Solution: Unified tagging using `${{ github.sha }}`

### 🔴 TLS Certificate Error

* Root Cause: K3s internal IP mismatch
* Solution: kubeconfig modification + TLS bypass

### 🔴 Kubernetes API Timeout

* Root Cause: Port 6443 blocked
* Solution: Updated AWS Security Group rules

### 🔴 PVC Pending

* Root Cause: Storage binding issue
* Solution: Correct PersistentVolumeClaim configuration

### 🔴 DiskPressure

* Root Cause: Resource-heavy workloads (LLM/Ollama)
* Solution: Optimized container resource allocation

---

## 📦 Tech Stack

* Docker
* Kubernetes (K3s)
* Terraform
* AWS EC2
* GitHub Actions
* MySQL
* Spring Boot

---

## 📂 Repository Structure

```
.
├── app/                # Application source code
├── docker/             # Docker configurations
├── k8s/                # Kubernetes manifests (dev/prod ready)
├── terraform/          # Infrastructure as Code
├── .github/workflows/  # CI/CD pipelines
└── docs/               # Architecture & documentation
```

---

## 📸 Project Screenshots

### Docker Containers

<img width="3840" height="1176" src="https://github.com/user-attachments/assets/a3a3d134-3f34-460f-b697-f4614e15238e" />

### CI/CD Pipeline

<img width="1854" height="1003" src="https://github.com/user-attachments/assets/d1c9a3ba-ac63-42ca-8b55-7dfe2f465216" />

---

## 🧩 Key Learnings

* Real-world CI/CD pipeline design
* Debugging Kubernetes production issues
* Infrastructure automation with Terraform
* Secure DevOps practices implementation

---

## 🚀 Future Enhancements

* Add Ingress Controller (NGINX)
* Implement HPA auto-scaling
* Integrate Prometheus & Grafana monitoring
* Move to managed Kubernetes (EKS)

---

## 📬 Connect With Me

* GitHub: https://github.com/Sachin8801
* LinkedIn: https://linkedin.com/in/sachin-singh-8166b3134

---

## 🤝 Credits

Base application:
https://github.com/TrainWithShubham/AI-BankApp-DevOps

Enhanced with:

* CI/CD Automation
* Kubernetes Deployment
* Security Scanning
* Infrastructure as Code
