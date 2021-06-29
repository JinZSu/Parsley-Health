output "iam_user_name" {
	description = "iam user name"
	value = element(concat(aws_iam_user.user.*.name,[""]),0)
}