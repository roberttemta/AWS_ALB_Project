

# launch 2 EC2 instances and install apache 

resource "aws_instance" "web-server" {
  count                       = length(var.subnet_cidr_private)
  instance_type               = "t2.micro"
  ami                         = data.aws_ami.amazon_linux_2.id
  vpc_security_group_ids      = [aws_security_group.web-server.id]
  subnet_id                   = element(aws_subnet.private.*.id, count.index)
  user_data                   = file("install_httpd.sh")
  associate_public_ip_address = true
  tags = {
    Name = "web-server-${count.index + 1}"
  }

}
