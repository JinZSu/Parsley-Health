module "iam_user_1" { //Basic unecrypted user with no profile
	source = "../../modules/iam"

	name = "test1"
}


module "iam_user_2" { //Basic unecrypted user with no profile
	source = "../../modules/iam"

	name = "test2"
}


module "iam_user_3" { //Basic unecrypted user with no profile
	source = "../../modules/iam"

	name = "test3"
}

