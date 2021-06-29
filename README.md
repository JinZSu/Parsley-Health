# Terraform IAM Design

## _Table of Content_

| Topic | Summary | 
| --- | ---| 
| About Me | This Terraform IAM Design to in regards to the prompt presented by Parsley-Health|


## _About ME_
This Terraform IAM Design to in regards to the prompt presented by Parsley-Health. The prompt can be found in prompt As for the set up for localstack, the default ports were all at 4566!

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
With the focus of 
>Imagine that this is a small part of our Terraform code base that will need to delegate privileges to other services besides Dynamodb and you are the first person to represent IAM resources with Terraform.
>Please try to make your code reusable in the future.

The design and approach so the infrastructure architecture was crafted:
![alt text](https://github.com/JinZSu/Parsley-Health/blob/main/Design.png)

The prompt presented was
> Use Terraform to create a DynamoDB table named “parsley” that has two keys named “Parsley-1” and “Parsley-2”.
>Parsley-1 will always be a string and Parsley-2 will always be a
number.

(1) Resource

The Design of this resource would be a DynamoDB table named Parsley with two attributes name Parsley-1 and Parsley 2. The code below is the design of such dynamoDB table.

```sh
(insert code)
```

The prompt presented was
>The DynamoDB table should allow one user with read/write access to both keys and one user with read-only access to Parsley-2.
>The read/write user is a developer type.
>The read-only user is a product manager type.
>The users should be managed by IAM to the maximum extent
possible.

(2) Users [module.iam]

The design was of the User module was crafted with the Security in mind. The module will have a default password policy:
| Password_Policy | Description | 
| --- | ---| 
| iam_user | README---|
| iam_group | README ---|
The Module will also allow users to be created with or without a PGP KEY and/or a SSH Public Key. The Variables in this module are listed below:

Now the focus is how do we enforce these permissions with the mindset of modularity? 
>The DynamoDB table should allow one user with read/write access to both keys and one user with read-only access to Parsley-2.

The solution that I came up with was to enforce these users into groups that can be extanded to other parties that might need to access these credentials in the future. 

(3) Groups [module.group_policy]

There are curerntly two users in this prompt; The Developer and The Manager. The Manager is limited to read-only to Parsley-2, while the Developer has read/write to all whole DynamoDB. 

In this approach, I designed the Developer group to have the permission to access the Read policy and the Write policy of DynamoDB. Designing this group was tricky since the developer could be just given an iam_role of developer with read and write permission. The decision to choose the creation of a developer group was based on multiple reason. The first being that of security; The IAM role would _not require any credentials associated with it_. The second being that iam_roles are more for deployment to a test or development enviornments on aws. 

The Manager group would have permissions to view data that had the key of Parsley-2. This would require a modular policy template, that could be reusable in the future. My understanding of this limitation is that only certain users will be able to see data that had the special key. This limitation would be superuseful for other users such as other managers, interns or auditors (potentially). 

(4) Policy [module.group_policy]

Now the design of the policy is interesting. There to break the permissions down, there needs to be a read only policy and write only policy. Granted you can make a policy for both, but it wouldn't be modular. Modularity with read only policy and write only policy allows a higher degree in reusablity and modularity. The Developer group would obviously get this because of 
>>The read/write user is a developer type.

What's left is this interesting read only with the key "Parsley-2". The design of this policy was crafted with the mindset of modularity. By allowing a variable when searching for the key in the dynamoDB, this same policy template can be reused with another variable such as Parsley-1.

