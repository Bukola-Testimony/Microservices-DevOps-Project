provider "aws" {
  region  = "us-east-1"
  #profile = "default"
  access_key = "credentials('AWS_ACCESS_KEY_ID')"
  secret_key = "credentials('AWS_SECRET_ACCESS_KEY')"   
}

