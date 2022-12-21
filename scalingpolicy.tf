resource "aws_autoscaling_group" "auto_scale_plan" {
  name_prefix = "example"

  launch_configuration = aws_launch_template.EC2_Launch_Template.name
  availability_zones   = ["ap-south-1a"]

  min_size = 0
  max_size = 3

  tags = [
    {
      key                 = "application"
      value               = "auto_scale_public"
      propagate_at_launch = true
    },
  ]
}
resource "aws_autoscalingplans_scaling_plan" "auto_scale_plan" {
  name = "example-dynamic-cost-optimization"

  application_source {
    tag_filter {
      key    = "application"
      values = ["auto_scale_public"]
    }
  }

  scaling_instruction {
    max_capacity       = 5
    min_capacity       = 2
    resource_id        = format("autoScalingGroup/%s", aws_autoscaling_group.auto_scale_plan.id)
    scalable_dimension = "autoscaling:autoScalingGroup:DesiredCapacity"
    service_namespace  = "autoscaling"

    target_tracking_configuration {
      predefined_scaling_metric_specification {
        predefined_scaling_metric_type = "ASGAverageCPUUtilization"
      }

      target_value = 45
    }
  }
}
  
