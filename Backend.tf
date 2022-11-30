terraform {
  backend "s3" {
    region         = "us-east-1"
    bucket         = "firstprojectbucketvbn"
    #dynamodb_table = "FirstProject-tfstate-backend-lock"
    #profile        = ""
    #role_arn       = ""
    encrypt        = "true"
    key            = "FirstProject.tfsate"
  }
}