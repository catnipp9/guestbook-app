Guestbook Application: Docker, Kubernetes & OpenShift
This repository contains the source code and deployment configurations for the Guestbook Application, a full-stack project developed as the final requirement for the "Introduction to Containers w/ Docker, Kubernetes & OpenShift" course. This course is a core component of the IBM Full Stack Software Developer Professional Certificate on Coursera.

🎓 Project Context
This project demonstrates the ability to containerize a web application, orchestrate it using Kubernetes, and leverage OpenShift’s enterprise features.

Key Objectives:

Containerizing a Go-based application using a multi-stage Docker build.

Managing container images via IBM Cloud Container Registry (ICR).

Deploying and scaling the application on a Kubernetes cluster.

Configuring Horizontal Pod Autoscaling (HPA) based on CPU utilization.

Performing Rolling Updates and Rollbacks.

Deploying via OpenShift Image Streams for automated internal registry synchronization.

🚀 Technical Stack
Backend: Go (Golang 1.15)

Frontend: HTML/JavaScript/jQuery

Containerization: Docker (Multi-stage builds)

Orchestration: Kubernetes (Deployments, Services, HPA)

Cloud Platform: IBM Cloud & OpenShift

🛠️ Installation & Setup
1. Build and Push the Image
To build the container image and push it to the IBM Cloud Container Registry:

Bash
export MY_NAMESPACE=sn-labs-hadjirasulja
docker build . -t us.icr.io/$MY_NAMESPACE/guestbook:v1
docker push us.icr.io/$MY_NAMESPACE/guestbook:v1
2. Deploy to Kubernetes
Apply the deployment and service configurations:

Bash
kubectl apply -f deployment.yml
3. Autoscale the Application
The project includes a Horizontal Pod Autoscaler that triggers when CPU load exceeds 50%:

Bash
kubectl autoscale deployment guestbook --cpu-percent=50 --min=1 --max=10
📈 Deployment Features
Rolling Updates & Rollbacks
The project demonstrates zero-downtime updates. To update the application to version 2:

Update the index.html and rebuild the image.

Apply the new configuration: kubectl apply -f deployment.yml.

To rollback to the previous version:

Bash
kubectl rollout undo deployment/guestbook --to-revision=1
OpenShift Integration
Utilized OpenShift Image Streams to mirror images from the external IBM registry to the internal OpenShift registry:

Bash
oc tag us.icr.io/$MY_NAMESPACE/guestbook:v1 guestbook:v1 --reference-policy=local --scheduled
📂 Project Structure
/v1/guestbook: Core application source code and Dockerfile.

deployment.yml: Kubernetes manifests for Deployment and Service.

public/: Frontend assets (HTML, CSS, JS).

👨‍💻 Author
Jamel P. Hadjirasul 4th Year Computer Engineering Student at CIT – University GitHub: catnipp9
