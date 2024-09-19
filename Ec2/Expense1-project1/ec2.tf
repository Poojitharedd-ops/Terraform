resource "aws_instance" "terraforminstance" {
    count = length(var.instance_names)
  ami = data.ami_aws.amiinfo.id
  instance_type = var.instance_names[count.index] == "mysql" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-ssh-terraform.id]
  

tags = {
    Name = var.instance_names[count.index]
  }
 }



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




 