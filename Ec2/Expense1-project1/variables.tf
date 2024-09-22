variable "instance_names" {
  type        = list(string)
  default     =  ["mysql", "backend", "frontend"]
  description = "description"
}

variable "domain_name" {

  default = "poojitha.online"
}
 variable "zone_id" {
    default = "Z006556131LDN8TABV8RK"
}