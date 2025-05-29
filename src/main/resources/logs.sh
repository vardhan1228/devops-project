#!/bin/bash
LOG_DIR="/var/log/httpd"
S3_BUCKET="s3://devops-assignment-time/logs/$(hostname)-$(date +%Y%m%d-%H%M%S)"

aws s3 cp $LOG_DIR $S3_BUCKET --recursive
