locals {
  full_instance_name = "${var.instance_id}-${var.environment}"
}

output "full_instance_name" {
  value = local.full_instance_name
}
