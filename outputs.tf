output "alarm_arns" {
  description = "ARNs of created CloudWatch alarms"
  value = {
    disk_queue_depth            = try(aws_cloudwatch_metric_alarm.disk_queue_depth[0].arn, null)
    database_connections_writer = try(aws_cloudwatch_metric_alarm.database_connections_writer[0].arn, null)
    database_connections_reader = try(aws_cloudwatch_metric_alarm.database_connections_reader[0].arn, null)
    cpu_utilization_writer      = try(aws_cloudwatch_metric_alarm.cpu_utilization_writer[0].arn, null)
    cpu_utilization_reader      = try(aws_cloudwatch_metric_alarm.cpu_utilization_reader[0].arn, null)
    aurora_replica_lag          = try(aws_cloudwatch_metric_alarm.aurora_replica_lag[0].arn, null)
    swap_usage_writer           = try(aws_cloudwatch_metric_alarm.swap_usage_writer[0].arn, null)
    swap_usage_reader           = try(aws_cloudwatch_metric_alarm.swap_usage_reader[0].arn, null)
    freeable_memory_writer      = try(aws_cloudwatch_metric_alarm.freeable_memory_writer[0].arn, null)
    freeable_memory_reader      = try(aws_cloudwatch_metric_alarm.freeable_memory_reader[0].arn, null)
  }
}
