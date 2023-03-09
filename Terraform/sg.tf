
resource "aws_security_group" "EKS_SG" {
  name        = "Eks-sg"
  description = "security group for eks"
  vpc_id      = "vpc-0b5aabe280121437d"


  ingress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "Eks-sg"
  }
}
