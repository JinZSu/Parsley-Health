module "iam_group_Developer" {
	source = "../../modules/group_policy"

	group_name = "Developer_group"

	group_membership_name = "Developer_group_membership"

	users = [module.iam_user_1.iam_user_name]

	policy_name = "Parsely-2_READER"

	target_attribute = "Parsely-2"

}


module "iam_group_Developer2" {
	source = "../../modules/group_policy"

	group_name = "Developer_group2"

	group_membership_name = "Developer_group2_membership"

	users = [
		module.iam_user_2.iam_user_name,
		module.iam_user_3.iam_user_name
	]

	policy_name = "Parsely-2_RW"

	read = true
	write = false

}
