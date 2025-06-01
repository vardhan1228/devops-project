resource "aws_s3_bucket" "tech" {
    bucket = var.bucket_name
    # -${replace(replace(replace(replace(timestamp(), "-", ""), ":", ""), "T", ""), "Z", "")}"
    force_destroy = true

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name = "techeazy"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.tech.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "public_read_policy" {
  bucket = aws_s3_bucket.tech.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject"]
        Resource  = "${aws_s3_bucket.tech.arn}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.public_access]
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle_rule" {
  bucket = aws_s3_bucket.tech.id

  rule {
    id     = "DeleteLogsAfter7Days"
    status = "Enabled"

    filter {
      prefix = "logs/"
    }

    expiration {
      days = 7
    }
  }
}






  
