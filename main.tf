resource "aws_cloudwatch_metric_alarm" "disk_queue_depth" {
  count               = var.create_alarms ? 1 : 0
  alarm_name          = "rds-${var.db_cluster_identifier}-writer-DiskQueueDepth"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "DiskQueueDepth"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Maximum"
  threshold           = var.alarm_thresholds.disk_queue_depth
  alarm_description = "RDS Maximum DiskQueueDepth for RDS aurora cluster ${var.db_cluster_identifier} writer"
  alarm_actions     = var.alarm_actions
  ok_actions        = var.alarm_actions

  dimensions = {
    DBClusterIdentifier = var.db_cluster_identifier
    Role                = "WRITER"
  }

  tags = var.tags
}

resource "aws_cloudwatch_metric_alarm" "database_connections_writer" {
  count               = var.create_alarms ? 1 : 0
  alarm_name          = "rds-${var.db_cluster_identifier}-writer-DatabaseConnections"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Sum"
  threshold           = var.alarm_thresholds.database_connections
  alarm_description   = "RDS Maximum connection for RDS aurora cluster ${var.db_cluster_identifier} writer"
  alarm_actions     = var.alarm_actions
  ok_actions        = var.alarm_actions

  dimensions = {
    DBClusterIdentifier = var.db_cluster_identifier
    Role                = "WRITER"
  }

  tags = var.tags
}

resource "aws_cloudwatch_metric_alarm" "database_connections_reader" {
  count               = var.create_alarms && var.create_reader_alarms ? 1 : 0
  alarm_name          = "rds-${var.db_cluster_identifier}-reader-DatabaseConnections"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Maximum"
  threshold           = var.alarm_thresholds.database_connections
  alarm_description   = "RDS Maximum connection for RDS aurora cluster ${var.db_cluster_identifier} reader(s)"
  alarm_actions     = var.alarm_actions
  ok_actions        = var.alarm_actions

  dimensions = {
    DBClusterIdentifier = var.db_cluster_identifier
    Role                = "READER"
  }

  tags = var.tags
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_writer" {
  count               = var.create_alarms ? 1 : 0
  alarm_name          = "rds-${var.db_cluster_identifier}-writer-CPU"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Maximum"
  threshold           = var.alarm_thresholds.cpu_utilization
  alarm_description   = "RDS CPU for RDS aurora cluster ${var.db_cluster_identifier} writer"
  alarm_actions     = var.alarm_actions
  ok_actions        = var.alarm_actions

  dimensions = {
    DBClusterIdentifier = var.db_cluster_identifier
    Role                = "WRITER"
  }

  tags = var.tags
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_reader" {
  count               = var.create_alarms && var.create_reader_alarms ? 1 : 0
  alarm_name          = "rds-${var.db_cluster_identifier}-reader-CPU"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Maximum"
  threshold           = var.alarm_thresholds.cpu_utilization
  alarm_description   = "RDS CPU for RDS aurora cluster ${var.db_cluster_identifier} reader(s)"
  alarm_actions     = var.alarm_actions
  ok_actions        = var.alarm_actions

  dimensions = {
    DBClusterIdentifier = var.db_cluster_identifier
    Role                = "READER"
  }

  tags = var.tags
}

resource "aws_cloudwatch_metric_alarm" "aurora_replica_lag" {
  count               = var.create_alarms && var.create_reader_alarms ? 1 : 0
  alarm_name          = "rds-${var.db_cluster_identifier}-reader-AuroraReplicaLag"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "AuroraReplicaLag"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Maximum"
  threshold           = var.alarm_thresholds.aurora_replica_lag
  alarm_description   = "RDS Aurora replica lag for RDS aurora cluster ${var.db_cluster_identifier}"
  alarm_actions     = var.alarm_actions
  ok_actions        = var.alarm_actions

  dimensions = {
    DBClusterIdentifier = var.db_cluster_identifier
    Role                = "READER"
  }

  tags = var.tags
}

resource "aws_cloudwatch_metric_alarm" "swap_usage_writer" {
  count               = var.create_alarms ? 1 : 0
  alarm_name          = "rds-${var.db_cluster_identifier}-writer-SwapUsage"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "SwapUsage"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Maximum"
  threshold           = var.alarm_thresholds.swap_usage
  alarm_description   = "RDS swap usage for RDS aurora cluster ${var.db_cluster_identifier} writer"
  alarm_actions     = var.alarm_actions
  ok_actions        = var.alarm_actions

  dimensions = {
    DBClusterIdentifier = var.db_cluster_identifier
    Role                = "WRITER"
  }

  tags = var.tags
}

resource "aws_cloudwatch_metric_alarm" "swap_usage_reader" {
  count               = var.create_alarms && var.create_reader_alarms ? 1 : 0
  alarm_name          = "rds-${var.db_cluster_identifier}-reader-SwapUsage"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "SwapUsage"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Maximum"
  threshold           = var.alarm_thresholds.swap_usage
  alarm_description   = "RDS swap usage for RDS aurora cluster ${var.db_cluster_identifier} reader(s)"
  alarm_actions     = var.alarm_actions
  ok_actions        = var.alarm_actions

  dimensions = {
    DBClusterIdentifier = var.db_cluster_identifier
    Role                = "READER"
  }

  tags = var.tags
}

resource "aws_cloudwatch_metric_alarm" "freeable_memory_writer" {
  count               = var.create_alarms ? 1 : 0
  alarm_name          = "rds-${var.db_cluster_identifier}-writer-FreeableMemory"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "FreeableMemory"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Minimum"
  threshold           = var.alarm_thresholds.freeable_memory
  alarm_description   = "RDS freeable memory for RDS aurora cluster ${var.db_cluster_identifier} writer"
  alarm_actions     = var.alarm_actions
  ok_actions        = var.alarm_actions

  dimensions = {
    DBClusterIdentifier = var.db_cluster_identifier
    Role                = "WRITER"
  }

  tags = var.tags
}

resource "aws_cloudwatch_metric_alarm" "freeable_memory_reader" {
  count               = var.create_alarms && var.create_reader_alarms ? 1 : 0
  alarm_name          = "rds-${var.db_cluster_identifier}-reader-FreeableMemory"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "FreeableMemory"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Minimum"
  threshold           = var.alarm_thresholds.freeable_memory
  alarm_description   = "RDS freeable memory for RDS aurora cluster ${var.db_cluster_identifier} reader(s)"
  alarm_actions     = var.alarm_actions
  ok_actions        = var.alarm_actions

  dimensions = {
    DBClusterIdentifier = var.db_cluster_identifier
    Role                = "READER"
  }

  tags = var.tags
}
