terraform {
  backend "s3" {
    bucket = "exam-details01"
    region = "us-east-1"
    key    = "exam-eks/statefile"
  }
}
