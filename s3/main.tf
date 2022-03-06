resource "aws_s3_bucket" "private" {
  bucket = "mutao-tf-bucket"
  versioning {
    enabled = false
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

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
