# cloudtrail.tf
# CloudTrail logs all API calls made in your AWS account

resource "aws_cloudtrail" "main" {
  name                          = "baseline-cloudtrail"
  s3_bucket_name                = aws_s3_bucket.cloudtrail_logs.id
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
  depends_on                    = [aws_s3_bucket_policy.cloudtrail_logs]

  tags = {
    Name        = "Baseline CloudTrail"
    Environment = "Baseline"
    Purpose     = "Security audit trail"
  }
}
