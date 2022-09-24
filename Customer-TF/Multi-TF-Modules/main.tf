
data "aws_ami" "ubuntu" {
  most_recent = true

data "aws_ssm_parameter" "db_pass" {
  name = var.param_db_pass_name
}

data "aws_ssm_parameter" "db_user" {
  name = var.param_db_user_name
}

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "myapp" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = var.name
  }
}
