provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "demo-server" {
    ami = "ami-05b5a865c3579bbc4"
    instance_type = "t3.micro"
    key_name = "demo"
}