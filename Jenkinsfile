#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('Terraform/eks') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
        stage("Deploy microservices app to EKS") {
            steps {
                script {
                    dir('microservices-demo/deploy/kubernetes') {
                        sh "aws eks --region us-east-1 update-kubeconfig --name Eks-cluster"
                        sh "kubectl apply -f complete-demo.yaml"
                    }
                }
            }
        }
        stage("Deploy my web-application to EKS") {
            steps {
                script {
                    dir('my-webapp') {
                        sh "aws eks --region us-east-1 update-kubeconfig --name Eks-cluster"
                        sh "kubectl apply -f web-deployment.yml"
                    }
                }
            }
        }
        stage("Deploy prometheus and grafana monitoring application to EKS") {
            steps {
                script {
                    dir('microservices-demo/deploy/kubernetes/manifests-monitoring') {
                        sh "aws eks --region us-east-1 update-kubeconfig --name Eks-cluster"
                        sh "kubectl apply -f 00-monitoring-ns.yaml"
                        sh "kubectl apply -f ${ls *-prometheus-*.yaml}"
                        sh "kubectl apply ${ls *-grafana-*.yaml | grep -v grafana-import}"
                        sh "sleep 60s"
                        sh "kubectl apply -f 23-grafana-import-dash-batch.yaml"
                        sh "kubectl get deployment -n sock-shop"
                        sh "kubectl get svc -n sock-shop"
                        sh "kubectl get deployment -n web"
                        sh "kubectl get svc -n web"
                        sh "sleep 120s"
                        sh "kubectl get deployment -n monitoring"
                        sh "kubectl get svc -n monitoring"
                    }
                }
            }
        }
    }
}
 