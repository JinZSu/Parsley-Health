#Terraform IAM Design

## _About ME_
This prompt design incorporates everything for the terraform to run

## _Running Terraform_
To run Terriform you have to first initialize it! 
```sh
terraform init
```
To plan for Terriform
```sh
terraform plan
```
To run apply Terriform 
```sh
terraform apply
```
To run destroy Terriform 
```sh
terraform destroy
```

##Files

(1) dynamo.tf is where the dynamoDB is created
(2) iam_users.tf is where the users are created 
(3) iam_groups.tf is where the groups module is called to incorporate users from iam_users.tf
(4) main.tf is where the aws provider and endpoints is located