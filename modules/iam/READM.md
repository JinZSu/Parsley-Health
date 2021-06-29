# Terraform IAM Design

#Aboute Me
This module is dedicated to the formation of iam users

## _Group policy_

iam_user.tf : forms the iam_user and other credentials


## Variables

| Variable | Description | Type | Default |
| --- | --- | --- | --- |
|password_policy|Password_policy | bool | true|
|ssh_public_key | Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format | string | "" |
|ssh_key_encoding | target attribute of read only | string | "SSH" |
|upload_ssh_key | Upload SSH_KEY | bool | false |
|access_key | Generate Access Key | bool | false |


|password_reset_required | Reset the generate password at first login | bool | true  |
|password_length | Length of generated password on resource creation | string | "" |
|pgp_key | base-64 PGP public or keybase:username, which looks up username at keybase.io | string | "" |



|login_profile | create IAM user login profile | bool | false |
| name | Name of the IAM user | string |  |
| path | Path of the IAM user | string | "/" |
| force_destroy | Destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. | bool | false |
| tags | Key-value map of tags for the IAM user | map(string) | {} |
| permissions_boundary | ARN of the policy that is used to set the permissions boundary for the user | string | "" |
