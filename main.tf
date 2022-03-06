variable "aws_access_key" {

}
variable "aws_secret_key" {

}

terraform {
  required_providers {
    aws = "~> 3.74"
  }
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "s3_storage" {
  source = "./s3"
}
