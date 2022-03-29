
terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "goutam-friday"
    key    = "tftoday"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 4"

  name          = "vasya.pupkin"
  force_destroy = true

  #pgp_key = "keybase:test"

  password_reset_required = false
}
