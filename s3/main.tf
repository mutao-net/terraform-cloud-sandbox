resource "aws_s3_bucket" "bucket-sample" {
  bucket = "mutao-sample-bucket"
  acl    = "private"
  lifecycle_rule {
    enabled = true
    expiration {
      days = "180"
    }
  }
}
