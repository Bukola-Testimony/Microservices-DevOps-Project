#!/bin/bash
set -ex

#login into the eks cluster
aws eks update-kubeconfig --name Eks-cluster --region us-east-1

#installing helm chart
kubectl apply -f microservices-demo/deploy/kubernetes/helm-chart/Chart.yaml
sleep 20s
kubectl apply -f microservices-demo/deploy/kubernetes/helm-chart/requirements.yaml
sleep 20s
kubectl apply -f microservices-demo/deploy/kubernetes/helm-chart/values.yaml

