terraform {
  backend "s3" {
    region  = "us-east-1"
    bucket  = "firstprojectbucketvbn"
    encrypt = "true"
    key     = "FirstProject.tfstate"
  }
}