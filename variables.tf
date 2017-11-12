variable "cache_name" {}

variable "engine" {}

variable "engine_version" {}

variable "node_type" {}

variable "node_count" {}

variable "parameter_group_name" {}

variable "port" {}

variable "subnet_ids" {
  type = "list"
}

variable "vpc_id" {}
