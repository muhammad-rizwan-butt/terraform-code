terraform {
  backend "s3" {
    bucket         = "upwork-bucket"   # Your S3 bucket name
    key            = "terraform.tfstate" # The path inside the bucket for your state file
    region         = "us-east-1"                    # Your bucket's region
  }
}
