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

output "greengrass_certificate_pem" {
  description = "The AWS IoT certificate PEM for the Greengrass core."
  value       = aws_iot_certificate.greengrass_core.certificate_pem
  sensitive   = true
}

output "greengrass_private_key" {
  description = "The private key for the Greengrass core certificate."
  value       = aws_iot_certificate.greengrass_core.private_key
  sensitive   = true
}

output "greengrass_certificate_files" {
  description = "Paths to the generated certificate, private key, and public key files."
  value = {
    certificate = local_file.greengrass_certificate.filename
    private_key = local_file.greengrass_private_key.filename
    public_key  = local_file.greengrass_public_key.filename
  }
}

output "greengrass_iot_policy_name" {
  description = "Name of the IoT policy attached to the Greengrass core."
  value       = aws_iot_policy.greengrass_core.name
}
