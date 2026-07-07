output "greengrass_role_arn" {
  description = "ARN of the IAM role used for Greengrass."
  value       = aws_iam_role.greengrass.arn
}

output "greengrass_iot_thing_name" {
  description = "Name of the AWS IoT thing that represents the Greengrass core."
  value       = aws_iot_thing.greengrass_core.name
}

output "greengrass_iot_certificate_arn" {
  description = "ARN of the AWS IoT certificate for the Greengrass core."
  value       = aws_iot_certificate.greengrass_core.arn
}

output "greengrass_iot_policy_name" {
  description = "Name of the IoT policy attached to the Greengrass core."
  value       = aws_iot_policy.greengrass_core.name
}
