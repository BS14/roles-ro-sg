output "IAM_RoleName" {
    description = "The Name of the IAM role"
    value = aws_iam_role.StackGuardianIntegrationRole.name
}
output "RoleArn" {
  description = "The ARN of the created IAM role"
  value       = aws_iam_role.StackGuardianIntegrationRole.arn
}
