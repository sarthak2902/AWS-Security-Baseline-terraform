# guardduty.tf
# Enables GuardDuty threat detection in this region

resource "aws_guardduty_detector" "main" {
  enable                       = true
  finding_publishing_frequency = "FIFTEEN_MINUTES"

  tags = {
    Name        = "Baseline GuardDuty"
    Environment = "Baseline"
    Purpose     = "Threat detection"
  }
}