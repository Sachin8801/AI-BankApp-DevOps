provider "aws" {
  region = "ap-south-1"
}
resource "aws_eip" "k8s_eip" {
  instance = aws_instance.k8s_server.id
  domain   = "vpc"
}
resource "aws_instance" "k8s_server" {
  ami           = "ami-0f58b397bc5c1f2e8" # Ubuntu 22.04 (update if needed)
  instance_type = "t2.medium"
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.k8s_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y curl

              # Install Docker
              apt install -y docker.io
              systemctl enable docker
              systemctl start docker

              # Install k3s
              curl -sfL https://get.k3s.io | sh -

              # Give access
              chmod 644 /etc/rancher/k3s/k3s.yaml
              EOF

  tags = {
    Name = "bankapp-k8s-server"
  }
}

resource "aws_security_group" "k8s_sg" {
  name = "k8s-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}