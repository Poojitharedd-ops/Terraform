resource "aws_instance" "expense" {
    count = length(var.instance_names)
  ami                     = "ami-09c813fb71547fc4f"
  instance_type           = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-ssh-terraform.id]
  

tags = merge(
    var.common_tags,
    {
        Name = var.instance_names[count.index]
    }
)
  }
 resource "aws_security_group" "allow-ssh-terraform"  {
    name = var.sg_name
  description = var.sg_description
   tags = var.common_tags


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
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.ingress_cidr_blocks #allowing from everyone for now
    ipv6_cidr_blocks = ["::/0"]
  }
 }
