terraform {
  backend "s3" {
    bucket         = "elasticbeanstalk-ap-south-1-814257489889"  
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}
