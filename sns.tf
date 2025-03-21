resource "aws_sns_topic" "alarm_topic" {
  name = "${local.name_prefix}-alarm-topic"
}

resource "aws_sns_topic_subscription" "alarm_topic_sub" {
  topic_arn = aws_sns_topic.alarm_topic.arn
  protocol = "email"
  endpoint = "${local.email_address}"
}