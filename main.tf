terraform {
  required_providers {
    aws = "~> 3.74"
  }
}

variable "aws_access_key" {

}
variable "aws_secret_key" {

}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "ap-northeast-1"
}

/*
module "s3_storage" {
  source = "./s3"
}
*/

module "iam" {
  source = "./iam"
}
