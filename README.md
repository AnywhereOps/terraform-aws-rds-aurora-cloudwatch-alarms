# AWS RDS Aurora CloudWatch Alarms

Terraform module that creates CloudWatch alarms for an existing RDS Aurora cluster.

## Usage

```hcl
module "rds_alarms" {
  source = "github.com/anywhereops/terraform-aws-rds-aurora-cloudwatch-alarms"

  db_cluster_identifier = module.rds.cluster_id
  alarm_actions         = [aws_sns_topic.alerts.arn]

  alarm_thresholds = {
    cpu_utilization      = 80
    database_connections = 1000
  }

  tags = {
    Environment = "production"
  }
}
```

## Alarms Created

| Alarm | Metric | Default Threshold | Condition |
|-------|--------|-------------------|-----------|
| Writer DiskQueueDepth | DiskQueueDepth | 20 | >= threshold |
| Writer DatabaseConnections | DatabaseConnections | 500 | >= threshold |
| Reader DatabaseConnections | DatabaseConnections | 500 | >= threshold |
| Writer CPU | CPUUtilization | 70% | >= threshold |
| Reader CPU | CPUUtilization | 70% | >= threshold |
| Aurora Replica Lag | AuroraReplicaLag | 2000ms | >= threshold |
| Writer SwapUsage | SwapUsage | 100MB | >= threshold |
| Reader SwapUsage | SwapUsage | 100MB | >= threshold |
| Writer FreeableMemory | FreeableMemory | 200MB | <= threshold |
| Reader FreeableMemory | FreeableMemory | 200MB | <= threshold |

Reader alarms are only created when `create_reader_alarms = true` (default).

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | >= 4.12.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| db_cluster_identifier | The DB cluster identifier to create alarms for | `string` | n/a | yes |
| create_alarms | Whether to create CloudWatch alarms | `bool` | `true` | no |
| create_reader_alarms | Whether to create reader alarms (set to true if cluster has read replicas) | `bool` | `true` | no |
| alarm_actions | Actions for CloudWatch alarms (e.g. SNS topic ARNs) | `list(string)` | `[]` | no |
| alarm_thresholds | Alarm thresholds (see below) | `object` | `{}` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |

### alarm_thresholds

| Key | Default | Description |
|-----|---------|-------------|
| database_connections | 500 | Max connections |
| cpu_utilization | 70 | CPU % |
| disk_queue_depth | 20 | Queue depth |
| aurora_replica_lag | 2000 | Lag in ms |
| freeable_memory | 200000000 | Memory in bytes (~200MB) |
| swap_usage | 100000000 | Swap in bytes (~100MB) |

## Outputs

| Name | Description |
|------|-------------|
| alarm_arns | Map of alarm names to their ARNs |
