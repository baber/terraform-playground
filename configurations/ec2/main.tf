


resource "aws_instance" "test_ec2_instance" {
  ami = "ami-1a7f6d7e"
  instance_type = "t2.nano"
  tags = {
    Name = "${var.instance_name}"
  }
  security_groups = ["${var.security_group}"]
}