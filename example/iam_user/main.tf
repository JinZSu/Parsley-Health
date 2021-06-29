module "iam_user" { //Basic unecrypted user with no profile
	source = "../../modules/iam"

	name = "test"
}

module "iam_user_login" { //Basic user with login
	source = "../../modules/iam"

	name = "test_login"

	access_key= true

	login_profile = true
	pgp_key = "keybase:test"

}

module "iam_user_ssh" { //Basic user with ssh
	source = "../../modules/iam"

	name = "test_ssh"

	access_key= true

	login_profile = true
	pgp_key = "keybase:test"

	upload_ssh_key = true
	ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCRKvYwmflRaSQZp/Z0XU6w3jPCrspnNu7NebfMPFXfhjI7JxZPRtTIN7imkGg1WS6PGmHFfZRZGSN+V4eX+X3uyvU3ZrzZbz8oV6DFDQi9kvnM1HMLz07kLOhu94/uZtpIYbWYfSRJQSJ9MsINzyXT4WbL+97LImBBMxCvSlG9i0AeRBCSRXE+hin1iJquZiH2j3GV007gW21kcvoCZnHONCIucbSQUBevNBibWh4ljf1s1bKo0fkEPMMcyMUpeQ9GswNUHAYgfovrDecwmtJZV4ll/Raf8L6MbWo0Oko+J9ZQ6coM5TW/pEZLewb6XyUeKDDWjOTVxr/W5fvpByPn"
}