variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    descripiton = "This is the ami id of devops-practice which is RHEL-9"
}
variable "instance_type" {
    type = string
    default = "t3.micro"
}
var "tags"{
    type = map
    default = {
        Name = "Backend"   
        Project = "Expense"
        Component = "backend"
        Environment = "Dev"
        Terraform = "True"
    }

    ]
}