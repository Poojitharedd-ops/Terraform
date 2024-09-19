variable "instance_names" {
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}

variable "common_tags" {
    type = map
    default = { 
        Project = "Expense"
        Environment = "Dev"
        Terraform = "True"
    }
}
variable "zone_id" {
    default = "Z006556131LDN8TABV8RK"
}

variable "domain_name" {
    default = "poojitha.online"
}
 variable "sg_name" {
        default = "alloww ssh"
    }

    variable "sg_description" {
    default = "allow port number 22 for ssh access"
}
variable "ingress_cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
   }
   
  variable "from_port" { 
    default = 22
    type = number

  }
   
   variable "to_port" {
    default = 22
    type = number
   }

   variable "protocol" {
    
   }
  