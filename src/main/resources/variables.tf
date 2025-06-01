variable "ami" {
description = "ami value"
type = string
default = "ami-0440d3b780d96b29d"
}

variable "instance_type" {
description = "instace type value"
type = string
default = ""
}

variable "key_name" {
description = "keyname value"
type = string
default = ""
}
variable "region" {
  description = "region"
  type = string
  default = ""
}
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default = ""
}
variable "pattoken" {
  type = string
  default = ""
  
}
variable "vpc-cidr" {}
variable "pub-sub1-cidr" {}
variable "pub-sub2-cidr" {}
variable "pub-sub1-az" {}
variable "pub-sub2-az" {}
variable "volumesize" {  }
variable "git-username-public" { }
variable "git-repo-public" {  }
variable "git-username-private" { }
variable "git-repo-priavte" {  }
variable "priavte-key-path" { }
variable "public-key-path" { }
variable "ec2-username" { }