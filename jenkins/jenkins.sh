#!/bin/bash
set -ex


export TF_VAR_region=$REGION
export TF_VAR_vpc_id=$VPC_ID
export TF_VAR_cluster_name=$CLUSTER_NAME

#go into to the terraform path
cd ${WORKSPACE}/Terraform-aws-eks

#replacing the cluster name field in backend.tf file
# sed -i "s/ngg_cluster_name/$CLUSTER_NAME/g" backend.tf

#running terraform command
terraform init    
terraform plan
terraform $ACTION --auto-approve

if [ $ACTION == "apply" ]; then
#login into the eks cluster
aws eks update-kubeconfig --name $CLUSTER_NAME --region $REGION
kubectl get pods -A

#installing bitnami helm chart
helm repo add bitnami https://charts.bitnami.com/bitnami

#installing eks helm chart
helm repo add eks https://aws.github.io/eks-charts

#installing nginx
helm upgrade --install nginx bitnami/nginx

#installing aws loadbalancer controller
helm upgrade --install lb-controller eks/aws-load-balancer-controller --set clusterName=$CLUSTER_NAME


# Apply sock-shop kubernetes manifest deployment
cd ${WORKSPACE}/microservices-demo/deploy/Kubernetes/complete-demo.yaml
kubectl apply -f complete-demo.yaml

# Apply MY-webapp kubernetes manifest deployment




else
echo "no need to install"
fi