
resource "aws_key_pair" "example" {
  key_name   = var.key_name # Replace with your desired key name
  public_key = file("~/.ssh/id_rsa.pub") 


}
resource "aws_instance" "vsv" {
  ami = var.ami
  key_name = aws_key_pair.example.key_name
  instance_type = var.instance_type
  user_data= file("vsv.sh")
  subnet_id = aws_subnet.pub-sub1.id
  vpc_security_group_ids = [ aws_security_group.cust-sg.id ]

  tags = {
    Name = "my-ec2"
  }
}

resource "null_resource" "null1" {
  provisioner "remote-exec" {
    inline = [
    "sudo yum update -y",
    "sudo yum install git -y",
    "sudo yum install httpd -y",
    "sudo systemctl start httpd",
    # Install Node.js 18 (you can change to another version if needed)
    "curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -",
    "sudo yum install -y nodejs",
    #############cloning the application#######################
    "git clone https://github.com/vardhan1228/fullstack-nodejs-application.git",
    "cd fullstack-nodejs-application/client",
    "timeout 120 npm install",
    "npm run build",
    "sudo cp -r build/* /var/www/html",
    "curl ${aws_instance.vsv.private_ip}"

    ]
    connection {
      host = aws_instance.vsv.public_ip
      private_key = file("~/.ssh/id_rsa")
      user = "ec2-user"
      type = "ssh"
    }
  }
  
}

