terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
  terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "remote-state-demo"
    region = "us-east-1"
  }
}



provider "aws" {
  # Configuration options
  region = "us-east-1"
}