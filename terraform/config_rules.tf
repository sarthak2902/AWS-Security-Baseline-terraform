# config-rules.tf
# AWS-managed Config rules that check the account against security best practices

locals {
  config_rules = {
    "root-account-mfa-enabled"         = "ROOT_ACCOUNT_MFA_ENABLED"
    "iam-root-access-key-check"        = "IAM_ROOT_ACCESS_KEY_CHECK"
    "iam-user-mfa-enabled"             = "IAM_USER_MFA_ENABLED"
    "cloudtrail-enabled"               = "CLOUD_TRAIL_ENABLED"
    "s3-bucket-public-read-prohibited" = "S3_BUCKET_PUBLIC_READ_PROHIBITED"
    "s3-bucket-ssl-requests-only"      = "S3_BUCKET_SSL_REQUESTS_ONLY"
  }
}

resource "aws_config_config_rule" "baseline" {
  for_each = local.config_rules

  name = "baseline-${each.key}"

  source {
    owner             = "AWS"
    source_identifier = each.value
  }

  depends_on = [aws_config_configuration_recorder_status.main]
}