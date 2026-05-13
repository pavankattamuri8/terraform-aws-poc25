resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  subnet_id     = var.subnet_id
  security_groups = [aws_security_group.sg.id]
}

output "instance_id" {
  value = aws_instance.this.id
}
