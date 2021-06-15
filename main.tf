variable "aws_access_key" {}
variable "aws_secret_key" {}


provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "ap-northeast-1"
}


resource "aws_instance" "TerraformExample" {
  ami        = "ami-001f026eaf69770b4"
  instance_type = "t3.micro"
}