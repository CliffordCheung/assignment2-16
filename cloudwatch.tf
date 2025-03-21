resource "aws_cloudwatch_log_metric_filter" "info_log_filter" {
  name = "info-count"
  pattern = "[INFO]"
  log_group_name = aws_cloudwatch_log_group.http_api.name
  
  metric_transformation {
    name = "info-count"
    namespace = "/moviedb-api/${local.name_prefix}"
    value = "1"
    unit = "None"
  }
}

resource "aws_cloudwatch_metric_alarm" "info_log_alarm" {
  alarm_name = "${local.name_prefix}-info-count-breach"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods = 1
  metric_name = "info-count"
  namespace = "/moviedb-api/${local.name_prefix}"
  period = 180 # every 3 minute interval
  statistic = "Sum"
  threshold = "10"
  alarm_description = "Alarm when [INFO] log count greater than 10 in every 3 minute interval"
  alarm_actions = []
}