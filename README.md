# CTS  Application
Connectivity test

## Table of Contents
1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
3. [Setup](#setup)
4. [Running the Application](#running-the-application)
5. [Testing](#testing)
6. [Building and Pushing Docker Image](#building-and-pushing-docker-image)
7. [Deploying to Kubernetes](#deploying-to-kubernetes)
8. [Deleting the Application](#deleting-the-application)
9. [CI/CD Pipeline](#cicd-pipeline)
10. [Contact](#contact)

## Introduction
This is the backend application for CTS (Connectivity test). It is built using Flask and is containerized using Docker. The deployment is managed using Kubernetes and Helm.

## Prerequisites
- Python 3.9+
- Docker
- Kubernetes (kubectl)
- Helm
- Google Cloud SDK with Kubernetes Engine component
- Google Cloud service account key with the necessary permissions

## Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/cts-backend.git
   cd cts-backend

2. Create a virtual environment and install dependencies:
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   pip3 install -r requirements.txt

## Running the Application:
1. To run the application locally:
   ```bash
   python3 app.py

  The application will be accessible at "http://127.0.0.1:8080"

## Testing:
1. To run the tests:
   ```bash
   python3 -m unittest discover -s tests -p 'test_*.py'

## Building and Pushing Docker Image:
1. Build the Docker image:
   ```bash
   docker build -t your-dockerhub-username/cts-backend:latest .

2. Push the Docker image to Docker Hub:
   ```bash
   docker login
   docker push your-dockerhub-username/cts-backend:latest

### Deploying to Kubernetes:
1. Authenticate to Google Cloud:
   ```bash
   gcloud auth activate-service-account --key-file=path/to/your-service-account-key.json
   gcloud config set project your-gcp-project-id
   gcloud container clusters get-credentials your-cluster-name --zone your-cluster-zone

2. Create a namespace if it doesn't exist:
   ```bash
   kubectl create namespace default

3. Deploy the application using Helm:
   ```bash
   helm upgrade --install cts ./helm_charts --namespace default --set image.repository=your-dockerhub-username/cts-backend --set image.tag=latest

4. Update your /etc/hosts file to map the ingress IP to the domain:
   ```bash
   echo "<INGRESS_IP> cts-example.com" | sudo tee -a /etc/hosts

5. Verify the deployment:
   ```bash
   curl -f http://cts-example.com/ping

## Deleting the Application:
1. To delete the application from Kubernetes using Helm:
   ```bash
   helm uninstall cts-backend --namespace default

### CI/CD Pipeline:
This project includes a GitHub Actions CI/CD pipeline configured in the .github/workflows/ci-cd.yml file. The pipeline includes the following jobs:

1. Build: Checks out the code, installs dependencies, runs tests, builds and pushes the Docker image.
2. Deploy: Authenticates to Google Cloud, sets up Kubernetes, and deploys the application using Helm.

## Triggering the Pipeline:
The pipeline is triggered on:
- Push to the main branch.
- Pull request to the main branch.


### Contact

For any questions or issues, please contact:
- Name: Benjamin Burgar
- Email: benjaminburgar658@gmail.com



