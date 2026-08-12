data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["*tomcat*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  # owners constraint removed so Terraform searches public AMIs matching the name filter
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t3.nano"

  tags = {
    Name = "HelloWorld"
  }
}
