resource "aws_s3_bucket" "example" {
  bucket = "practise-roboshop-terraform"

  tags = {
    Name        = "Roboshop-Bucket"
    Environment = "Practise"
  }
}