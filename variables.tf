variable "aws_region" {
  description = "AWS region where the Greengrass resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "name_prefix" {
  description = "Prefix used for the created AWS resources."
  type        = string
  default     = "greengrass-demo"
}
