# 🚀 Infrastructure as Code with Kubernetes

A complete **Infrastructure as Code (IaC)** project that deploys a **Web Application** and **Monitoring Stack (Prometheus + Grafana)** on a **Minikube Kubernetes Cluster** using **Terraform + Kubernetes Manifests**.

This project demonstrates real-world DevOps practices: IaC automation, container orchestration, monitoring, scaling, and Git-based workflow.

---

## 🌟 Overview

Automated infrastructure provisioning using Terraform and Kubernetes orchestration for scalable application deployment with built-in monitoring and high availability.

---

## 🛠️ Technologies Used

* **IaC**: Terraform → Infrastructure as Code
* **Orchestration**: Kubernetes (Minikube) → Container Orchestration
* **Monitoring**: Prometheus, Grafana → Observability Stack
* **Configuration**: Kubernetes ConfigMaps, Secrets
* **Container Runtime**: Docker

---

## 🏗️ Architecture

High-availability deployment with 3 replicas, load balancing, and automated scaling capabilities.

```
             ┌────────────────────────┐
             │     Terraform IaC      │
             │  - Namespace           │
             │  - Deployment          │
             │  - Service             │
             └──────────┬─────────────┘
                        │
                        ▼
        ┌───────────────────────────────────────┐
        │         Kubernetes Cluster            │
        │     (Minikube Local Environment)      │
        ├───────────────────────────────────────┤
        │ Deployment: 3 Replicas (Nginx App)    │
        │ Service: NodePort LoadBalancer        │
        │ ConfigMap: App Config                 │
        │ Monitoring: Prometheus + Grafana      │
        └───────────────────────────────────────┘
```

---

## ✨ Features

### Application Deployment
* **High Availability**: 3-replica deployment
* **Load Balancing**: NodePort service for external access
* **Health Checks**: Liveness & readiness probes
* **Resource Management**: CPU/Memory limits & requests
* **Auto-scaling**: HPA-ready structure

### Monitoring Stack
* **Prometheus**: Metrics collection and scraping
* **Grafana**: Visualization dashboards
* **Observability**: Full monitoring stack with NodePort access

### Infrastructure as Code
* **Terraform Provisioning**: Kubernetes namespace and resource automation
* **Declarative Manifests**: Version-controlled Kubernetes configurations
* **State Management**: Terraform state tracking
* **Reproducible Deployments**: Consistent infrastructure across environments

---

## 📁 Project Structure

```
kubernetes-terraform-iac/
│
├── k8s/
│   ├── deployment.yaml            # App deployment (3 replicas, probes, resources)
│   ├── service.yaml               # NodePort service for app
│   ├── configmap.yaml             # Environment config
│   └── monitoring.yaml            # Prometheus + Grafana manifests
│
├── terraform/
│   ├── main.tf                    # Terraform K8s provider + resources
│   ├── outputs.tf                 # Output values
│   ├── terraform.tfstate          # Auto-generated state
│   └── terraform.tfstate.backup
│
└── README.md
```

---

## 🚦 Getting Started

### Prerequisites
* Docker installed and running
* Minikube installed
* kubectl CLI tool
* Terraform installed

### 1️⃣ Start Minikube

```bash
minikube start
```

### 2️⃣ Deploy Using Terraform (IaC Automation)

```bash
cd terraform
terraform init
terraform apply -auto-approve
```

### 3️⃣ Deploy Kubernetes Manifests (App + Monitoring)

```bash
# From project root
kubectl apply -f k8s/
```

**OR** deploy with kubectl only (without Terraform):

```bash
kubectl apply -f k8s/
```

---

## 🔍 Verify Deployment

### Check pods:

```bash
kubectl get pods
```

### Check services:

```bash
kubectl get svc
```

### Check deployments:

```bash
kubectl get deployments
```

---

## 🌐 Access Applications

### Web Application (Nginx)

```bash
minikube service webapp-service
```
<img width="2974" height="717" alt="image" src="https://github.com/user-attachments/assets/3f727870-769b-45dc-972b-1a068e60a6e6" />

### 📊 Monitoring Dashboards

**Prometheus:**

```bash
minikube service prometheus-service
```

**Grafana:**

```bash
minikube service grafana-service
```

**Grafana Default Credentials:**
* Username: `admin`
* Password: `admin`

---

## 🧹 Cleanup & Destroy

### Remove Kubernetes resources:

```bash
kubectl delete -f k8s/
```

### Destroy Terraform-managed infrastructure:

```bash
cd terraform
terraform destroy -auto-approve
```

### Stop Minikube:

```bash
minikube stop
```

---

## 🧠 DevOps Concepts Demonstrated

* **Infrastructure as Code**: Terraform Kubernetes Provider
* **Container Orchestration**: Multi-replica Kubernetes deployments
* **Declarative Configuration**: Kubernetes manifests
* **Automated Provisioning**: Terraform automation
* **High Availability**: Load balancing & replica management
* **Health Monitoring**: Liveness & readiness probes
* **Resource Optimization**: CPU/Memory limits & requests
* **Observability**: Prometheus + Grafana monitoring stack
* **Configuration Management**: ConfigMaps and Secrets
* **Version Control**: Git-based infrastructure workflow

---

## 🎯 Future Enhancements

* Implement Horizontal Pod Autoscaler (HPA)
* Add Ingress controller for advanced routing
* Integrate CI/CD pipeline (GitHub Actions/Jenkins)
* Implement persistent storage with PVs and PVCs
* Add Helm charts for package management
* Multi-environment support (dev/staging/prod)

---

## 👩‍💻 Author

**Pooja Das**  
DevOps Engineer • Kubernetes • Terraform • Cloud Automation

---

## 📄 License

This project is open source and available for educational purposes.

---

