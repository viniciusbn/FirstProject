terraform {
  backend "s3" {
    region         = "us-east-1"
    bucket         = "firstprojectbucketvbn"
    dynamodb_table = "firstprojectdynamodbvbn"
    encrypt        = "true"
    key            = "FirstProjetc/FirstProject.tfsate"
  }
}