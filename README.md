# AWS Greengrass Terraform example

This folder contains a simple Terraform configuration that creates the AWS-side resources commonly needed for an AWS IoT Greengrass core device:

- an IAM role for Greengrass
- an AWS IoT thing for the core device
- an IoT policy and certificate
- the necessary policy attachments

## Usage

1. Install Terraform: https://developer.hashicorp.com/terraform/install
2. Configure AWS credentials before running Terraform. The simplest options are:
   - `aws configure` and provide your AWS access key, secret key, and default region, or
   - export environment variables:

```bash
export AWS_ACCESS_KEY_ID="YOUR_ACCESS_KEY"
export AWS_SECRET_ACCESS_KEY="YOUR_SECRET_KEY"
export AWS_DEFAULT_REGION="us-east-1"
```

3. Run:

```bash
terraform init
terraform plan -var="aws_region=us-east-1"
terraform apply -var="aws_region=us-east-1"
```

4. Use the outputs from Terraform to configure your Greengrass core device or to continue with the AWS Greengrass deployment workflow.

> This example is intentionally minimal. For a full production deployment, you will usually add a Greengrass component deployment and any additional IAM permissions required by your workload.
