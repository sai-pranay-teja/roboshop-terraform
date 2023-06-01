resource "aws_s3_bucket" "roboshop-bucket" {
  bucket = "practise-roboshop-terraform"

  tags = {
    Name        = "Roboshop-Bucket"
    Environment = "Practise"
  }
}