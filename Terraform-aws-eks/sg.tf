
resource "aws_security_group" "EKS_SG" {
  name        = "${var.cluster_name}-sg"
  description = "${var.cluster_name}-sg"
  vpc_id      = var.vpc_id


  ingress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    # cidr_blocks = [local.workstation-external-cidr]

  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "${var.cluster_name}-sg"
  }
}
