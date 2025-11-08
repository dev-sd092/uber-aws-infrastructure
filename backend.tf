# Configure remote backend with AWS S3 and DynamoDB for state locking
terraform {
  backend "s3" {
    bucket         = "uber-terraform-state-storage"    # Replace with your desired bucket name
    key            = "terraform.tfstate"
    region         = "us-east-1"                      # Replace with your desired region
    encrypt        = true
    dynamodb_table = "terraform-state-lock-for-uber-infra"          
  }
}