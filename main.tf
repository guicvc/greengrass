resource "aws_iam_role" "greengrass" {
  name = "${var.name_prefix}-greengrass-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "greengrass.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "greengrass_resource_access" {
  role       = aws_iam_role.greengrass.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGreengrassResourceAccessRolePolicy"
}

resource "aws_iot_thing" "greengrass_core" {
  name = "${var.name_prefix}-core"
}

resource "aws_iot_policy" "greengrass_core" {
  name = "${var.name_prefix}-greengrass-core-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "iot:*",
          "greengrass:*"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iot_certificate" "greengrass_core" {
  active = true
}

resource "aws_iot_policy_attachment" "greengrass_core" {
  policy = aws_iot_policy.greengrass_core.name
  target = aws_iot_certificate.greengrass_core.arn
}

resource "aws_iot_thing_principal_attachment" "greengrass_core" {
  thing     = aws_iot_thing.greengrass_core.name
  principal = aws_iot_certificate.greengrass_core.arn
}

resource "local_file" "greengrass_certificate" {
  content         = aws_iot_certificate.greengrass_core.certificate_pem
  filename        = "${path.module}/generated/${var.name_prefix}-certificate.pem.crt"
  file_permission = "0600"
}

resource "local_file" "greengrass_private_key" {
  content         = aws_iot_certificate.greengrass_core.private_key
  filename        = "${path.module}/generated/${var.name_prefix}-private.pem.key"
  file_permission = "0600"
}

resource "local_file" "greengrass_public_key" {
  content         = aws_iot_certificate.greengrass_core.public_key
  filename        = "${path.module}/generated/${var.name_prefix}-public.pem.key"
  file_permission = "0600"
}
