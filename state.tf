terraform {
  backend "s3" {
    bucket = "upwork-bucket-2244"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}
