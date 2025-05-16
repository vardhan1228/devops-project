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
  type = ""
}