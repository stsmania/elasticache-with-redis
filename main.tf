locals {
  replication_group_id = "${var.name}-redis-cluster"
}

resource "aws_elasticache_replication_group" "this" {
  replication_group_id          = format("%.20s", "${local.replication_group_id}")
  replication_group_description = "Terraform-managed ElastiCache replication group for ${local.replication_group_id}"
  node_type                     = var.node_type
  number_cache_clusters         = var.node_count
  automatic_failover_enabled    = var.node_count == 1 ? false : true
  engine_version                = var.engine_version
  parameter_group_name          = var.parameter_group_name
  subnet_group_name             = aws_elasticache_subnet_group.this.id
  security_group_ids            = var.security_group_ids
  tags = var.tags
}

resource "aws_elasticache_subnet_group" "this" {
  name        = "${var.name}-redis-cluster-subnet"
  description = "Elasticache subnet group for ${local.replication_group_id}"
  subnet_ids  = var.subnet_ids
}