variable "AWS_REGION" {
  default     = "us-east-1"
  description = "This is AWS region name"
}

variable "vpc_id" {
  default = "vpc-2d80ea55"
}

# Declare the data source
#data "aws_availability_zones" "azs" {}

