resource "aws_s3_bucket" "balde" {
  bucket = "s3-for-state-kd"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.balde.id
  versioning_configuration {
    status = "Enabled"
  }
}

  

#create dynamoDB
resource "aws_dynamodb_table" "table"{
    name = "state-lock"
    billing_mode="PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name= "LockID"
      type = "S"
    }

}