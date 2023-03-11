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
        stage("Deploy my-app to EKS") {
            steps {
                script {
                    dir('my-webapp') {
                        sh "aws eks --region us-east-1 update-kubeconfig --name Eks-cluster"
                        sh "kubectl apply -f web-deployment.yml"
                    }
                }
            }
        }
    }
}
