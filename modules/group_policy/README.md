# Terraform IAM Design

#Aboute Me
This module is dedicated to the formation of groups and policies

## _Group policy_

group.tf : forms the groups and adds the users with the corresponding policy
policy.tf : all the policy in data format

## Variables

| Variable | Description | Type | Default |
| --- | --- | --- | --- |
|region|aws provider region | string | us-east-1|
|account_id | aws account id | string | *|
|target_attribute | target attribute of read only | string | "" |
|group_name | aws group_name | string | "" |
|path | path in which to create the group | string | "/" |
|users | adding users to the group | list | [] |
|group_membership_name | name of group membership | string | "" |
|policy_name | policy_name to policy_attachment | string | "" |
|read | permission to basic read functions | bool | false |
|write | permission to basic write functions | bool | false |