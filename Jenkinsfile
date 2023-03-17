#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        // stage("Create an EKS Cluster") {
        //     steps {
        //         script {
        //             dir('Terraform/eks') {
        //                 sh "terraform init"
        //                 sh "terraform apply -auto-approve"
        //             }
        //         }
        //     }
        // }
        // stage("Deploy microservices app to EKS") {
        //     steps {
        //         script {
        //             dir('microservices-demo/deploy/kubernetes') {
        //                 sh "aws eks --region us-east-1 update-kubeconfig --name Eks-cluster"
        //                 sh "kubectl apply -f complete-demo.yaml"
        //             }
        //         }
        //     }
        // }
        // stage("Deploy my web-application to EKS") {
        //     steps {
        //         script {
        //             dir('my-webapp') {
        //                 sh "aws eks --region us-east-1 update-kubeconfig --name Eks-cluster"
        //                 sh "kubectl apply -f web-deployment.yml"
        //             }
        //         }
        //     }
        // }
        // stage("Deploy prometheus and grafana monitoring application to EKS") {
        //     steps {
        //         script {
        //             dir('microservices-demo/deploy/kubernetes/manifests-monitoring') {
        //                 sh "aws eks --region us-east-1 update-kubeconfig --name Eks-cluster"
        //                 sh "kubectl apply -f 00-monitoring-ns.yaml"                    
        //                 sh "kubectl apply -f 01-prometheus-sa.yaml"
        //                 sh "kubectl apply -f 02-prometheus-cr.yaml"
        //                 sh "kubectl apply -f 03-prometheus-crb.yaml"
        //                 sh "kubectl apply -f 04-prometheus-configmap.yaml"
        //                 sh "kubectl apply -f 05-prometheus-alertrules.yaml"
        //                 sh "kubectl apply -f 06-prometheus-dep.yaml"
        //                 sh "kubectl apply -f 07-prometheus-svc.yaml"
        //                 sh "kubectl apply -f 08-prometheus-exporter-disk-usage-ds.yaml"
        //                 sh "kubectl apply -f 10-kube-state-sa.yaml"
        //                 sh "kubectl apply -f 24-prometheus-node-exporter-sa.yaml"
        //                 sh "kubectl apply -f 25-prometheus-node-exporter-daemonset.yaml"
        //                 sh "kubectl apply -f 26-prometheus-node-exporter-svc.yaml"
        //                 sh "kubectl apply -f 11-kube-state-cr.yaml"
        //                 sh "kubectl apply -f 12-kube-state-crb.yaml"
        //                 sh "kubectl apply -f 13-kube-state-dep.yaml"
        //                 sh "kubectl apply -f 14-kube-state-svc.yaml"
        //                 sh "kubectl apply -f 20-grafana-configmap.yaml"
        //                 sh "kubectl apply -f 21-grafana-dep.yaml"
        //                 sh "kubectl apply -f 22-grafana-svc.yaml"
        //                 sh "sleep 120s"
        //                 sh "kubectl apply -f 23-grafana-import-dash-batch.yaml"
        //                 sh "kubectl get deployment -n sock-shop"
        //                 sh "kubectl get svc -n sock-shop"
        //                 sh "kubectl get deployment -n web"
        //                 sh "kubectl get svc -n web"
        //                 sh "sleep 60s"
        //                 sh "kubectl get deployment -n monitoring"
        //                 sh "kubectl get svc -n monitoring"
        //             }
        //         }
        //     }
        // }
        stage("Deploy Helm chart") {
            steps {
                script {
                    dir('microservices-demo/deploy/kubernetes/helm-chart/templates') {
                        sh "aws eks --region us-east-1 update-kubeconfig --name Eks-cluster"
                        sh "kubectl apply -f front-end-dep.yaml"
                        sh "kubectl apply -f cart-db-dep.yaml"
                        sh "kubectl apply -f ingress.yaml"
                        sh "kubectl apply -f loadtest-dep.yaml"
                    }
                }
            }
        }
        stage("Deploy Helm chart") {
            steps {
                script {
                    dir('microservices-demo/deploy/kubernetes/manifests-monitoring') {
                        sh "aws eks --region us-east-1 update-kubeconfig --name Eks-cluster"
                        sh "kubectl apply -f chart.yml"
                        sh "kubectl apply -f requirements.yml"
                        sh "kubectl apply -f values.yml"
                    }
                }
            }
        }
    }
}
 




