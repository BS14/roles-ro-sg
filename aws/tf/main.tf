resource "aws_iam_role" "StackGuardianIntegrationRole" {
  name = var.iam_role_name
  description = "IAM role for StackGuardian integration"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        AWS = "476299211833"
      },
      Action = "sts:AssumeRole",
      Condition = {
        StringEquals = {
          "sts:ExternalId" = var.external_id
        }
      }
    }]
  })

  tags = {
    "Name": "StackGuardianIntegrationRole"
    "Description": "IAM ReadOnlyAll role for StackGuardian integration"
    "CreatedBy": "StackGuardian"
    "Scope": "ReadOnlyAccess"
  }
}

resource "aws_iam_policy_attachment" "StackGuardianReadOnlyPolicyAttachment" {
  name = "StackGuardianReadOnlyPolicyAttachment"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  roles = [aws_iam_role.StackGuardianIntegrationRole.name]
}

