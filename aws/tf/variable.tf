variable "iam_role_name" {
    description = "Name of the IAM Role"
    type = string
    default = "StackGuardianIntegrationRole"
}
variable "external_id" {
    description = "External ID for StackGuardian Integration"
    type = string
    default = "StackGuardianRO"
}