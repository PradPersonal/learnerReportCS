resource "aws_ecr_repository" "ecr_repos" {
  for_each = var.repository_name
  name                 = each.value
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Project = "learnerReportCS-prad"
    Service = each.key
  }
}
