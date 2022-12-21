resource "aws_launch_template" "EC2_Launch_Template" {
  name_prefix   = "EC2-Launch-Template"
  image_id      = "ami-08df646e18b182346"
  instance_type = "t2.medium"
  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 20
    }
  }
  lifecycle {
    create_before_destroy = true
  }
   monitoring {
    enabled = true
  }
}