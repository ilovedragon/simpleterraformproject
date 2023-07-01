resource "aws_instance" "pohleng-Webserver" {
  count = 2
  ami           = "ami-05432c5a0f7b1bfd0"
  instance_type = "t2.micro"
  key_name = "pohleng_kp"
  associate_public_ip_address = true
  subnet_id = "subnet-d29198b4"
  vpc_security_group_ids = ["sg-020d927b4429e4fcfp"]

  tags = {
    Name = "pohleng-Webserver-${count.index}"
  }
}

resource "aws_instance" "pohleng-Ansibleserver" {
  ami           = "ami-05432c5a0f7b1bfd0"
  instance_type = "t2.micro"
  key_name = "pohleng_kp"
  associate_public_ip_address = true
  subnet_id = "subnet-d29198b4"
  vpc_security_group_ids = ["sg-020d927b4429e4fcfp"]

  tags = {
    Name = "pohleng-Ansibleserver"      
  }

  user_data = <<EOF
#!/bin/bash

# yum update
sudo yum update -y

# install pip
sudo yum install pip -y

# pip install ansible
sudo python3 -m pip install --user ansible

EOF
}

