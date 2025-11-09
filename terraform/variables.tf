variable "aws_region" {
  type        = string
  default     = "ca-central-1"
  description = "AWS region to deploy resources for learnerReportCS-prad"
}

variable "repository_name" {
  type        = map(string)
  default     = {
    frontend = "lrcs-frontend"
    backend = "lrcs-backend"
  }
  description = "learnerReportCS-prad"
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Project     = "learnerReportCS"
  }
  description = "learnerReportCS-prad"
}
