# AWS automation in order to provision EKS

## Requirements:

Terraform version 1.4.6 ( https://releases.hashicorp.com/terraform/1.4.6/ )
 
```
  wget https://releases.hashicorp.com/terraform/1.4.6/terraform_1.4.6_linux_amd64.zip
  unzip terraform_1.3.2_linux_amd64.zip
  sudo mv terraform /usr/local/bin/
  rm -fr terraform_1.3.2_linux_amd64.zip
```

AWS CLI (https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

## Credentials
Copy your aws credentials in your terminal so AWSCLI can have access on it as environment variables. Place the credentials within the commas.
```
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_DEFAULT_REGION=us-east-1
```
Deploy
```
cd terraform
terraform init
terraform plan
terraform apply
```
