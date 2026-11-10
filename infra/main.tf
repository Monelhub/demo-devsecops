provider "aws" {
  region = "eu-west-3"
}

resource "aws_s3_bucket" "data" {
  bucket = "demo-devsecops-trinome-2026"
}

resource "aws_s3_bucket_acl" "data_acl" {
  bucket = aws_s3_bucket.data.id
  acl    = "pubic-read"          # ❌ bucket public
}

resource "aws_security_group" "web" {
  name = "web-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # ❌ SSH ouvert à tout Internet
  }
}
