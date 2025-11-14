output "repository_urls" {
  description = "The URLs of the created ECR repositories"
  value = {
    # The 'each.key' here refers to the resource keys managed by Terraform's for_each
    for key, repo in aws_ecr_repository.ecr_repos : key => repo.repository_url
  }
}
output "jenkins_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}
