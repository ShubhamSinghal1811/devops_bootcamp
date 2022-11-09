terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.20.1"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA6JWWL57AW3JMTFVQA"
  secret_key = "lmYw8clz2mFgk2ZtJivBo+4Vlpb1ivZu7d+sT3fiA"
  
}
