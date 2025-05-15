#! /bin/bash
yum install -y at
systemctl start atd
echo "shutdown -h now" | at now + 15 minutes
