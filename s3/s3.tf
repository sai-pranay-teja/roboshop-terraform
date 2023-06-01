resource "aws_s3_bucket" "roboshop-bucket" {
  bucket = "practise-roboshop-terraform"
  force_destroy="true"

  tags = {
    Name        = "Roboshop-Bucket"
    Environment = "Practise"
  }
}