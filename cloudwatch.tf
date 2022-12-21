
resource "aws_cloudwatch_metric_alarm" "cpu-utilization" {
  alarm_name                = "high-cpu-utilization-alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
#  alarm_actions             = [ "${var.sns_topic}" ]

  dimensions = {
    InstanceId = "${var.instance_id}"
  }
}
resource "aws_cloudwatch_metric_alarm" "memory" {
  alarm_name = "memory-utilization-alarm-${var.env}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name = "mem_used_percent"
  namespace = "CWAgent"
  period = "300"
  statistic = "Average"
  threshold = "${var.alarms_memory_threshold}"
  alarm_description = "This metric monitors ec2 memory utilization"
#  alarm_actions = [ "${var.sns_topic}" ]
  insufficient_data_actions = []

  dimensions = {
    InstanceId = "${var.instance_id}"
  }
}

resource "aws_cloudwatch_metric_alarm" "instance-health-check" {
  alarm_name                = "instance-health-check"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "StatusCheckFailed"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "1"
  alarm_description         = "This metric monitors ec2 health status"
  insufficient_data_actions = []
#  alarm_actions             = [ "${var.sns_topic}" ]
dimensions = {
    InstanceId = "${var.instance_id}"
  }
}