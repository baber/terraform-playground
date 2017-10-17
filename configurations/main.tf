provider "aws" {
  region = "eu-west-2"
  skip_get_ec2_platforms = true
}


module "ec2" {
  source = "./ec2"
  instance_name = "${var.instance_name}"
  security_group = "${module.security-groups.group-name}"
}

module "security-groups" {
  source = "./security-groups"
}








