terraform {
  backend "s3" {
    region         = "us-east-1"
    bucket         = "firstprojectbucketvbn"
    dynamodb_table = "firstprojectdynamodbvbn"
    profile        = ""
    role_arn       = ""
    encrypt        = "true"
    key            = "FirstProjetc/FirstProject.tfsate"
  }
}