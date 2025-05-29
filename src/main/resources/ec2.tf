
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
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  root_block_device {
    volume_size = var.volumesize
  }

  tags = {
    Name = "my-ec2"
  }
}



