terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
}


provider "aws" {
  region = var.region
}

# locals {
  # should_use_encryption = var.encryption_key_arn != ""
# }

data "http" "website_file" {
  url = "https://torque-prod-cfn-assets.s3.amazonaws.com/public-assets/TetrisJS.html"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.prefix}-${var.name}"

  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "bucket_conf" {
  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}


resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [
        aws_s3_bucket_ownership_controls.ownership_controls.bucket.id,
        aws_s3_bucket_public_access_block.bucket.id,
  ]
  bucket = aws_s3_bucket.bucket.id
  acl = "public-read"
}

# resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encrypt_conf" {
  # Do not instantiate this resource if no arn value recieved as input
  # count = local.should_use_encryption ? 1 : 0
  # bucket = aws_s3_bucket.bucket.bucket

  # rule {
    # apply_server_side_encryption_by_default {
      # kms_master_key_id = var.encryption_key_arn
      # sse_algorithm     = "aws:kms"
    # }
  # }
# }

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${aws_s3_bucket.bucket.id}/*"
            ]
        }
    ]
}
EOF
}

resource "aws_s3_object" "webapp_file" {
  acl          = "public-read"
  key          = "index.html"
  bucket       = aws_s3_bucket.bucket.id
  content      = data.http.website_file.response_body
  content_type = "text/html"
}

resource "aws_s3_bucket_public_access_block" "access_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "ownership_controls" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}