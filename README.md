# 📒 Guestbook Application
### Docker, Kubernetes & OpenShift

> Final project for the **Introduction to Containers w/ Docker, Kubernetes & OpenShift** course — a core component of the [IBM Full Stack Software Developer Professional Certificate](https://www.coursera.org/professional-certificates/ibm-full-stack-cloud-developer) on Coursera.

---

## 🎓 Project Context

This project demonstrates the ability to containerize a web application, orchestrate it using Kubernetes, and leverage OpenShift's enterprise features.

**Key Objectives:**
- Containerizing a Go-based application using a multi-stage Docker build
- Managing container images via IBM Cloud Container Registry (ICR)
- Deploying and scaling the application on a Kubernetes cluster
- Configuring Horizontal Pod Autoscaling (HPA) based on CPU utilization
- Performing Rolling Updates and Rollbacks
- Deploying via OpenShift Image Streams for automated internal registry synchronization

---

## 🚀 Technical Stack

| Layer | Technology |
|---|---|
| Backend | Go (Golang 1.15) |
| Frontend | HTML / JavaScript / jQuery |
| Containerization | Docker (Multi-stage builds) |
| Orchestration | Kubernetes (Deployments, Services, HPA) |
| Cloud Platform | IBM Cloud & OpenShift |

---

## 📂 Project Structure

```
.
├── v1/guestbook/       # Core application source code and Dockerfile
├── deployment.yml      # Kubernetes manifests for Deployment and Service
└── public/             # Frontend assets (HTML, CSS, JS)
```

---

## 🛠️ Installation & Setup

### 1. Build and Push the Image

Build the container image and push it to the IBM Cloud Container Registry:

```bash
export MY_NAMESPACE=sn-labs-hadjirasulja
docker build . -t us.icr.io/$MY_NAMESPACE/guestbook:v1
docker push us.icr.io/$MY_NAMESPACE/guestbook:v1
```

### 2. Deploy to Kubernetes

Apply the deployment and service configurations:

```bash
kubectl apply -f deployment.yml
```

### 3. Autoscale the Application

Configure a Horizontal Pod Autoscaler that triggers when CPU load exceeds 50%:

```bash
kubectl autoscale deployment guestbook --cpu-percent=50 --min=1 --max=10
```

---

## 📈 Deployment Features

### Rolling Updates & Rollbacks

The project demonstrates zero-downtime deployments.

**To update to version 2:**
1. Update `index.html` and rebuild the image with the `v2` tag.
2. Apply the new configuration:
   ```bash
   kubectl apply -f deployment.yml
   ```

**To rollback to the previous version:**
```bash
kubectl rollout undo deployment/guestbook --to-revision=1
```

### OpenShift Integration

OpenShift Image Streams are used to mirror images from the external IBM registry to the internal OpenShift registry:

```bash
oc tag us.icr.io/$MY_NAMESPACE/guestbook:v1 guestbook:v1 \
  --reference-policy=local \
  --scheduled
```

---

