output "cache_security_group_id" {
  value = "${aws_security_group.redis.id}"
}

output "first_hostname" {
  value = "${aws_elasticache_cluster.redis.cache_nodes.0.address}"
}

output "hostnames" {
  value = "${join(",", aws_elasticache_cluster.redis.cache_nodes.*.address)}"
}

output "port" {
  value = "${var.port}"
}
