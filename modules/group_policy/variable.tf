variable "region" {
	description = "aws provider region"
	type = string
	default = "us-east-1" //limit it to the default region
}

variable "account_id" {
	description = "aws account id"
	type = string
	default = "*"
}

variable "target_attribute" {
	description = "target attribute of read only"
	type = string
	default = ""
}

variable "group_name" {
	description = "aws group_name"
	type = string
	default = ""
}

variable "path" {
	description = "path in which to create the group"
	type = string
	default = "/"
}

variable "users" {
	description = "adding users to the group"
	type = list
	default = []
}

variable "group_membership_name" {
	description = "users to add to policy_attachment"
	type = string
	default = ""
}

variable "policy_name" {
	description = "policy_name to policy_attachment"
	type = string
	default = ""
}

variable "read" {
	description = "permission to basic read functions"
	type = bool
	default = false
}

variable "write" {
	description = "permission to basic write functions"
	type = bool
	default = false
}

