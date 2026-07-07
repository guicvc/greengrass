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
  thing      = aws_iot_thing.greengrass_core.name
  principal  = aws_iot_certificate.greengrass_core.arn
}
