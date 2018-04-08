provider "aws" {
  region = "${var.AWS_REGION}"
}

data "aws_subnet_ids" "subnets" {
  vpc_id = "${var.vpc_id}"
}

data "aws_subnet" "subnets" {
  count = "${length(data.aws_subnet_ids.subnets.ids)}"
  id    = "${data.aws_subnet_ids.subnets.ids[count.index]}"
}

output "subnets_count" {
  value = "${length(data.aws_subnet_ids.subnets.ids)}"
}

output "subnets_id" {
  value = ["${data.aws_subnet.subnets.*.id}"]
}
