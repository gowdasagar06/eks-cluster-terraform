terraform {
  backend "s3" {
    bucket         = "terraform-bucket-ekscluster"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}
