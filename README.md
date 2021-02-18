# HelloworldAPI

The readme provides the instructions on creating the lambda handler and running the Terraform script to create your AWS infrastructure

Asssumptions:

1. AWS cli is installed
2. Terraform is installed
3. Python3 is installed

Pre-requisites:

1. run aws configure and create the aws profile
2. S3 bucket is created to store the lambda deployment package

STEP 1. Creating the lambda deployment package

1. Zip the lambda function
   zip -g sayhello.zip lambda_function.py

2. Upload the zip file to S3
   aws s3 cp sayhello.zip s3://<your code bucket>

STEP 2. Running the Terrform scripts

1. initialise terrform
   terrform init

2. update the vars.tf with your account specific details

3. run the script to create the infrastructure. I would advice the creation of a peroperties file varfile.tfvars to override the property values.
   terraform apply -var-file="varfile.tfvars"
