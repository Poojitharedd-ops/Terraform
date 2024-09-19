resource "aws_security_group" "allow-ssh-terraform"  {
    name = "alloww ssh"
  description = "allow port number 22 for ssh access"


# ingress means incoming traffic
#eggress is outgoing traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    ingress  {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #allowing from everyone for now
    ipv6_cidr_blocks = ["::/0"]
  }

  
  tags = {
    Name = "alloww ssh"
  }
}
resource "aws_instance" "terraforminstance" {
  ami                     = "ami-09c813fb71547fc4f"
  instance_type           = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-ssh-terraform.id]
  

tags = {
    Name = "Terraform"
  }
 }



 