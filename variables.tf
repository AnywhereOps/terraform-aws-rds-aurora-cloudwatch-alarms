variable "db_cluster_identifier" {
  description = "The DB cluster identifier to create alarms for"
  type        = string
}

variable "create_alarms" {
  description = "Whether to create CloudWatch alarms"
  type        = bool
  default     = true
}

variable "create_reader_alarms" {
  description = "Whether to create reader alarms (set to true if cluster has read replicas)"
  type        = bool
  default     = true
}

variable "alarm_actions" {
  description = "Actions for CloudWatch alarms (e.g. SNS topic ARNs)"
  type        = list(string)
  default     = []
}

variable "alarm_thresholds" {
  description = "Thresholds for CloudWatch alarms"
  type = object({
    database_connections = optional(number, 500)
    cpu_utilization      = optional(number, 70)
    disk_queue_depth     = optional(number, 20)
    aurora_replica_lag   = optional(number, 2000)
    freeable_memory      = optional(number, 200000000)
    swap_usage           = optional(number, 100000000)
  })
  default = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
