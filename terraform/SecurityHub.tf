# securityhub.tf
# Central security dashboard + AWS Foundational Security Best Practices checks

resource "aws_securityhub_account" "main" {
  enable_default_standards = false

  depends_on = [aws_config_configuration_recorder_status.main]
}

resource "aws_securityhub_standards_subscription" "fsbp" {
  standards_arn = "arn:aws:securityhub:${data.aws_region.current.name}::standards/aws-foundational-security-best-practices/v/1.0.0"

  depends_on = [aws_securityhub_account.main]
}