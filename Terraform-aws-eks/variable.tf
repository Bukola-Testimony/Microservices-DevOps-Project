# variable "region" {
#     default = "ap-south-1"
# }

variable "vpc_id" {
  description = "default Vpc"
  type        = string
  default     = "vpc-0b5aabe280121437d"
}

variable "cluster_name" {
  default = "Eks-cluster"
}

variable "node_group_name" {
  default = "Eks-node"
}

variable "node_instance_type" {
  default = "t2.micro"
}











#############################################################

# # variables.tf
# variable "vpc_id" {
#   description = "default Vpc"
#   type        = string
#   default     = "vpc-0b5aabe280121437d"
# }


# variable "instance1_name" {
#   description = "Value of the Name tag for the EC2 instance"
#   type        = string
#   default     = "lms1-practice"
# }

# variable "instance2_name" {
#   description = "Value of the Name tag for the EC2 instance"
#   type        = string
#   default     = "lms2-practice"
# }

# variable "ami" {
#   default     = "ami-06878d265978313ca"
#   type        = string
#   description = "aws ubuntu virtual machine image"
# }

# variable "keypair" {
#   default     = "ansiblekeys"
#   type        = string
#   description = "key pairs"
# }


# variable "subnet_id" {
#   description = "public subnets id in default VPC"
#   type        = list(any)
#   default     = ["subnet-0de160f0944ddea3a", "subnet-0586de2e0c8cc7eaa"]
# }


# variable "vpc_sg_id" {
#   description = "default VPC security group"
#   type        = string
#   default     = "vpc-0b5aabe280121437d"
# }

# # variable "keypair" {
# #   default     = 'file("/home/bukola/.ssh/ansiblekeys.pem")'
# #   type        = string
# #   description = "key pairs"
# # }




# ######################### ROUTE-53 ####################

# variable "ssl_certificate" {
#   default     = "arn:aws:acm:us-east-1:336078645485:certificate/b217008e-31fe-42d5-aa47-eeedca3fcf1f"
#   description = "My Domain SSL certificate"
#   type        = string
# }


# variable "zone-id" {
#   default     = "Z0250793JO3W7INOVM5H"
#   description = "Route 53 Hosted-zone id"
#   type        = string

# }


# variable "domain-name" {
#   default     = "altschool.bukolatestimony.me"
#   description = "Hosted-zone name"
#   type        = string

# }




#  ids = [
#       + "subnet-0586de2e0c8cc7eaa",
#       + "subnet-066de48ff35b4a0d3",
#       + "subnet-0b409c858b4fd18bb",
#       + "subnet-0cfcc20c6e92e7dc7",
#       + "subnet-0de160f0944ddea3a",
#       + "subnet-0f2aa9b49b9306cdf",
#     ]
