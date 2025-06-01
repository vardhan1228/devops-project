
####################public-repoclone and deploy sample app throuhgh provisioner######################
resource "null_resource" "null1" {
  depends_on = [ aws_instance.vsv ]
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
    "git clone https://github.com/${var.git-username-public}/${var.git-repo-public}.git",
    "cd fullstack-nodejs-application/client",
    "timeout 120 npm install",
    "npm run build",
    "sudo cp -r build/* /var/www/html",
    "curl ${aws_instance.vsv.private_ip}"

    ]
    connection {
      host = aws_instance.vsv.public_ip
      private_key = file(var.priavte-key-path)
      user = var.ec2-username
      type = "ssh"
    }
  }
  
}

####################priavte-repclone and copy files to s3 ######################

# locals {
#   pattoken = var.pattoken
# }

resource "null_resource" "privaterepo-clone" {
  depends_on = [aws_instance.vsv,null_resource.null1]

  connection {
    type        = "ssh"
    host        = aws_instance.vsv.public_ip
    user        = var.ec2-username
    private_key = file(var.priavte-key-path)
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
      "git clone https://${var.pattoken}@github.com/${var.git-username-private}/${var.git-repo-priavte}.git",
      "aws s3 cp ${var.git-repo-priavte}/ s3://${var.bucket_name}/ --recursive",
      "sudo mv /home/ec2-user/logs.sh /usr/local/bin/logs.sh",
      "sudo chmod +x /usr/local/bin/logs.sh",
      "sudo mv /home/ec2-user/logs.service /etc/systemd/system/logs.service",
      "sudo systemctl enable logs.service",
      "sudo systemctl start logs.service",
      "aws s3 ls s3://${var.bucket_name} --recursive"

    ]
  
  }
  
}

