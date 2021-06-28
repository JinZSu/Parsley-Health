# Terraform IAM Design

## _Table of Content_

| Topic | Summary | 
| --- | ---| 
| About Me | This Terraform IAM Design to in regards to the prompt presented by Parsley-Health|


## _About ME_
This Terraform IAM Design to in regards to the prompt presented by Parsley-Health. The prompt can be found in prompt.txt. As for the set up for localstack, the default ports were all at 4566!

## _Requirements_ 
| Requirement | Source | 
| --- | ---| 
| Terraform | <https://www.terraform.io>|
| Docker | <https://www.docker.com> |
| Localstack | <https://github.com/localstack/localstack> |

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

## _Modules_

The Modules are broken down into to components. The first being the set up for the IAM user and the second being setting up policies for the group.

| Module | README | 
| --- | ---| 
| iam_user | README---|
| iam_group | README ---|

## _The Approach_
In the diagram below, the approach to design was simple. The user group would be broken down into the iam_user module, which will create the user with default policies that enforces password security as well as setting up the PGP Key and SSH Public Key. 
