provider "aws" {
  region = "${var.AWS_REGION}"
}

# Below two data soruce blocks are mandatory
data "aws_subnet_ids" "subnets1" {
  vpc_id = "${var.vpc_id}"
}

data "aws_subnet" "subnets" {
  count = "${length(data.aws_subnet_ids.subnets1.ids)}"

  id = "${data.aws_subnet_ids.subnets1.ids[count.index]}"
}

output "subnets_id" {
  value = ["${data.aws_subnet.subnets.*.id}"]
}

output "subnets_id_1" {
  value = ["${data.aws_subnet.subnets.0.id}"]
}

output "subnets_count" {
  value = "${length(data.aws_subnet_ids.subnets1.ids)}"
}
