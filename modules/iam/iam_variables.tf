variable "password_policy" {
	description = "Password_policy"
	type = bool
	default = true
}

variable "ssh_public_key" {
	description = "SSH public key"
	type = string
	default = ""
}

variable "ssh_key_encoding" {
	description = "Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format"
	type = string
	default = "SSH"
}

variable "upload_ssh_key" { //To call aws_iam_user_ssh_key
	description = "Upload SSH_KEY"
	type = bool
	default = false
}

variable "access_key" {
	description = "Generate Access Key"
	type = bool
	default = false
}

variable "password_reset_required" {
	description = "Reset the generate password at first login"
	type = bool
	default = true //Good Security pratice to always reset password at first login
}

variable "password_length" {
	description = "Length of generated password on resource creation"
	type = number
	default = 30 // Let us boost the standard and up it to 30 from 20
}

variable "pgp_key" {
	description = "base-64 PGP public or keybase:username, which looks up username at keybase.io"
	type = string
	default = ""
}

variable "login_profile" { //To call aws_iam_user_login_profile
	description = "create IAM user login profile"
	type = bool
	default = false
}

variable "name" {
	description = "Name of the IAM user"
	type = string
}

variable "path" {
	description = "Path of the IAM user"
	type = string
	default = "/"
}

variable "force_destroy" {
	description = "Destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices."
	type = bool
	default = false
}

variable "tags" {
	description = "Key-value map of tags for the IAM user" //Will overwrite those defined at provider-level. Might be useful for auto-asign permissions
	type = map(string)
	default = {}
}

variable "permissions_boundary" {
	description = "ARN of the policy that is used to set the permissions boundary for the user"
	type = string
	default = ""
}