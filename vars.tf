variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "eu-west-2"
}

variable "s3_bucket" { default = "inovacode" }

variable "accountId" { default = "0000000" }

variable "sprint" { default = "1" }

variable "lambda_identity_timeout" { default = 1000 }
