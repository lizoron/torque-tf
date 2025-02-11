
data "aws_ami" "ubuntu" {
  most_recent = true

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

#new below
resource "aws_s3_bucket" "bucket" {
    bucket = var.s3_bucket
    force_destroy = true  
    acl = "public-read-write"

    tags = {
    Name        = "My bucket"
    }
}