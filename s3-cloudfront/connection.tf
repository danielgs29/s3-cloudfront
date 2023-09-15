terraform {
  backend "s3" {
    bucket = "s3-for-state-kd"
    dynamodb_table = "state-lock"
    key = "global/mystatefile/terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
  }
}

provider "aws" {
  region = "eu-west-1"
}