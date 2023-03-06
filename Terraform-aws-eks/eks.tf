# This will fectch the ip of my work station
data "http" "workstation-external-ip" {
  url = "http://ipv4.icanhazip.com"
}


locals {
  workstation-external-cidr = "${chomp(data.http.workstation-external-ip.body)}/32"
}


# data "aws_subnet_ids" "subnet_id" {
#   vpc_id = var.vpc_id

#   tags = {
#     Name = "pub*"
#   }
# }



data "aws_subnets" "subnet_id" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    Name = "pub*"
  }

}

output "ids" {
  value = data.aws_subnets.subnet_id.ids
}


resource "aws_eks_cluster" "myeks" {
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster_role.arn

  vpc_config {

    subnet_ids              = data.aws_subnets.subnet_id.ids
    endpoint_private_access = true
    endpoint_public_access  = false
    security_group_ids      = [aws_security_group.EKS_SG.id]

  }

}


resource "aws_eks_node_group" "mynode_node" {
  cluster_name    = aws_eks_cluster.myeks.name
  node_group_name = "${var.cluster_name}-node"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = data.aws_subnets.subnet_id.ids

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }

  instance_types = [var.node_instance_type]
}