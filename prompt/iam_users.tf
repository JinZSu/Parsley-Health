module "iam_user_Developer" { //Since developer is the stone of this build, PGPG and ssh public key should be present.
	source = "../modules/iam"

	name = "Developer_Brooklyn"

	access_key= true

	login_profile = true
	pgp_key = "keybase:test"

	upload_ssh_key = true
	ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCRKvYwmflRaSQZp/Z0XU6w3jPCrspnNu7NebfMPFXfhjI7JxZPRtTIN7imkGg1WS6PGmHFfZRZGSN+V4eX+X3uyvU3ZrzZbz8oV6DFDQi9kvnM1HMLz07kLOhu94/uZtpIYbWYfSRJQSJ9MsINzyXT4WbL+97LImBBMxCvSlG9i0AeRBCSRXE+hin1iJquZiH2j3GV007gW21kcvoCZnHONCIucbSQUBevNBibWh4ljf1s1bKo0fkEPMMcyMUpeQ9GswNUHAYgfovrDecwmtJZV4ll/Raf8L6MbWo0Oko+J9ZQ6coM5TW/pEZLewb6XyUeKDDWjOTVxr/W5fvpByPn"
}

module "iam_user_Manger" { //Manger should have access_key and have their PGP in system
	source = "../modules/iam"

	name = "Manger_Brooklyn"

	access_key= true

	login_profile = true
	pgp_key = "keybase:test"
}