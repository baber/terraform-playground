provider "aws" {
  region = "eu-west-2"
  profile = "baber_terraform"
  skip_get_ec2_platforms = true
}

resource "aws_instance" "baber-example" {
  ami = "ami-1a7f6d7e"
  instance_type = "t2.nano"
  tags = {
    Name = "baber-test-ec2"
  }
}