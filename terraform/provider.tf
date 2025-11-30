terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "my-terraform-state-bucket-serverless"
    key = "lambda-cicd/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}