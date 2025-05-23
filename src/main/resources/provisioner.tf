
####################public-repoclone and deploy sample app throuhgh provisioner######################
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

####################priavte-repclone and copy files to s3 ######################


resource "null_resource" "privaterepo-clone" {
  depends_on = [aws_instance.vsv,null_resource.null1]

  connection {
    type        = "ssh"
    host        = aws_instance.vsv.public_ip
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
  }

  provisioner "file" {
    source      = "./logs.sh"
    destination = "/home/ec2-user/logs.sh"
  }

  provisioner "file" {
    source      = "./logs.service"
    destination = "/home/ec2-user/logs.service"
  }

  provisioner "remote-exec" {
    inline = [
      "git clone https://${local.pattoken}@github.com/vardhan1228/Portfolio.git",
      "aws s3 cp Portfolio/ s3://${aws_s3_bucket.tech.bucket}/ --recursive",
      "sudo mv /home/ec2-user/logs.sh /usr/local/bin/logs.sh",
      "sudo chmod +x /usr/local/bin/logs.sh",
      "sudo mv /home/ec2-user/logs.service /etc/systemd/system/logs.service",
      "sudo systemctl enable logs.service",
      "sudo systemctl start logs.service",
      "aws s3 ls s3://${aws_s3_bucket.tech.id} --recursive"

    ]
  
  }
  
}

