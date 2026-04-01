# 🚀 Next-Gen Banking Platform with Local LLM Integration

![CI Pipeline](https://github.com/Sachin8801/AI-BankApp-DevOps/actions/workflows/ci.yml/badge.svg)
![Docker](https://img.shields.io/badge/docker-enabled-blue)
![Security](https://img.shields.io/badge/security-trivy-green)
![Java](https://img.shields.io/badge/java-21-orange)

## 📌 Overview

End-to-end DevOps implementation of a **3-tier cloud-native application**, fully automated using CI/CD and Infrastructure as Code.

---

## 🏗️ Architecture

* **Frontend + Backend**: Spring Boot (Dockerized)
* **Database**: MySQL (Kubernetes Deployment)
* **Orchestration**: Kubernetes (K3s)
* **CI/CD**: GitHub Actions
* **Infrastructure**: Terraform (AWS EC2)

---

## 🔄 CI/CD Pipeline Flow

```
1. Code Push (GitHub)
2. Build & Test (Maven)
3. Docker Build & Tag
4. Push Image to Docker Hub
5. Terraform → Provision EC2 + Security Groups + EIP
6. K3s Cluster Setup
7. Kubernetes Deployment
8. Service Exposure (NodePort)
```

---

## ☁️ Infrastructure (Terraform)

* EC2 instance provisioning
* Security group configuration:

  * SSH (22)
  * Kubernetes API (6443)
  * App Port (30007)
* Elastic IP for stable access

---

## ☸️ Kubernetes Setup

* Namespace isolation (`bank-app`)
* ConfigMap + Secrets
* MySQL Deployment + Service
* Application Deployment + Service

---

## ⚠️ Challenges & Fixes

### 🔴 ImagePullBackOff

* Cause: Image tag mismatch
* Fix: Unified tagging with `${{ github.sha }}`

---

### 🔴 TLS Certificate Error

* Cause: K3s internal IP mismatch
* Fix: Modified kubeconfig + TLS bypass

---

### 🔴 Kubernetes API Timeout

* Cause: Port 6443 blocked
* Fix: Updated AWS Security Group

---

### 🔴 PVC Pending

* Cause: Missing storage binding
* Fix: Correct PVC configuration

---

### 🔴 DiskPressure

* Cause: Heavy workloads (Ollama)
* Fix: Optimized resource usage

---

## 🌐 Access Application

```
http://<EC2-Public-IP>:30007
```

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

## ✅ Result

* Fully automated deployment pipeline
* Infrastructure + application lifecycle managed end-to-end
* Production-style DevOps implementation

---

## 📸 Screenshots
- Docker Containers creations and testing.
   <img width="3840" height="1176" alt="image" src="https://github.com/user-attachments/assets/a3a3d134-3f34-460f-b697-f4614e15238e" />
- CICD Github actions
  <img width="1854" height="1003" alt="image" src="https://github.com/user-attachments/assets/d1c9a3ba-ac63-42ca-8b55-7dfe2f465216" />


---

## 📬 Connect With Me

- GitHub: https://github.com/Sachin8801  
- LinkedIn: https://linkedin.com/in/sachin-singh-8166b3134


---

## 🤝 Credits

Base application sourced from an open-source repository:  
https://github.com/TrainWithShubham/AI-BankApp-DevOps

Enhanced with DevOps practices including containerization, CI/CD, security scanning, and Kubernetes deployment.



