resource "aws_iam_account_password_policy" "strict"{
	minimum_password_length = 18
	require_lowercase_characters = true
	require_numbers = true
	require_uppercase_characters = true
	require_symbols = true //good practice to add in special character to make it unique
	allow_users_to_change_password = true
	password_reuse_prevention = 7 //stop them from using old password
	max_password_age = 364
}

resource "aws_iam_user" "user" {
	name = var.name
	path = var.path

	force_destroy = var.force_destroy
	permissions_boundary = var.permissions_boundary

	tags = var.tags
}

resource "aws_iam_user_login_profile" "login_profile" { //login password generator
	count = var.login_profile ? 1 : 0

	user = aws_iam_user.user.name
	pgp_key = var.pgp_key
	password_length = var.password_length
	password_reset_required = var.password_reset_required
}

resource "aws_iam_access_key" "access_key_unencrypted" { //access key with no PGP
	count = var.pgp_key == "" ? 1 : 0

	user = aws_iam_user.user.name
}

resource "aws_iam_access_key" "access_key_encrypted" { //access key with PGP
	count = var.pgp_key != "" ? 1 : 0

	user = aws_iam_user.user.name
	pgp_key = var.pgp_key
}

resource "aws_iam_user_ssh_key" "ssh"{
	count = var.upload_ssh_key ? 1 : 0

	username = aws_iam_user.user.name
	encoding = var.ssh_key_encoding
	public_key = var.ssh_public_key
}