

resource "aws_security_group" "sg-test-ec2-security-group" {
  name        = "allow_whitelisted_ssh"
  description = "Allow ssh access from whitelisted ip addresses"
}


resource "aws_security_group_rule" "ssh_inbound" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks     = ["163.171.33.130/32"]
  security_group_id = "${aws_security_group.sg-test-ec2-security-group.id}"
}