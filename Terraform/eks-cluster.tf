module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 19.0"
  cluster_name    = "Eks-cluster"
  cluster_version = "1.24"

  cluster_endpoint_public_access = true


  vpc_id     = "vpc-0b5aabe280121437d"
  subnet_ids = ["subnet-0f2aa9b49b9306cdf", "subnet-066de48ff35b4a0d3"]


  tags = {
    environment = "development"
  }


  eks_managed_node_groups = {
    dev = {
      min_size     = 1
      max_size     = 2
      desired_size = 2

      instance_types = ["t2.small"]
    }

    tags = {
      name        = "Eks-cluster"
      environment = "development"
    }

  }
}