# Define the local variable for the file path
locals {
  e_commerce_filepath = "d:/Cloud Engineer/test-devops/E-Commerce"
}

# Add website files to S3 bucket
resource "aws_s3_object" "ecomm-frontend" {
  bucket   = aws_s3_bucket.ecomm-bucket.id
  key      = each.key
  for_each = fileset(local.e_commerce_filepath, "**")
  source   = "${local.e_commerce_filepath}/${each.value}"
  etag     = filemd5("${local.e_commerce_filepath}/${each.value}")

  tags = {
    Name = "ecomm-bucket-object"
  }

}

