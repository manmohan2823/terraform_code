terraform {
  backend "s3" {
    bucket = "my-terraformstatebucket"
    key    = "path/to/my/key"
    region = ap-south-1
  }
}
