resource "aws_security_group" "redis" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name = "elasticache-${var.cache_name}"
  }
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "${var.cache_name}"
  engine               = "${var.engine}"
  engine_version       = "${var.engine_version}"
  node_type            = "${var.node_type}"
  num_cache_nodes      = "${var.node_count}"
  parameter_group_name = "${var.parameter_group_name}"
  port                 = "${var.port}"
  security_group_ids   = ["${aws_security_group.redis.id}"]
  subnet_group_name    = "${aws_elasticache_subnet_group.redis.name}"

  tags {
    Name = "${var.cache_name}"
  }
}

resource "aws_elasticache_subnet_group" "redis" {
  name       = "${var.cache_name}-subnet-group"
  subnet_ids = ["${var.subnet_ids}"]
}
