variable "region" {
  description = "AWS region"
  default = "us-east-1"
}

variable "lambda_function_name" {
  description = "Name of lambda fucntion"
  default = "serverless-devops-lambda"
}

variable "lambda_handler" {
  description = "lamnda handler"
  default = "app.handler"
}

variable "runtime" {
  description = "Runtime for lambda"
  default = "python3.9"
}