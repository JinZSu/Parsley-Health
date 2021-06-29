resource "aws_iam_group" "title" {
	name = var.group_name
	path = var.path
}

resource "aws_iam_group_membership" "group_membership" {

	name = var.group_membership_name

	users = var.users
	group = aws_iam_group.title.name
}

resource "aws_iam_policy" "policy_attribute" {
	count = length(var.target_attribute) != 0 ? 1 : 0

	description = "policy test"
	policy = data.aws_iam_policy_document.DynamoDB_Target_READ.json
}

resource "aws_iam_policy" "policy_w" {
    count = var.read ? 1 : 0

    description = "policy test"
    policy = data.aws_iam_policy_document.DynamoDB_READ.json
}

resource "aws_iam_policy" "policy_r" {
    count = var.write ? 1 : 0

    description = "policy test"
    policy = data.aws_iam_policy_document.DynamoDB_WRITE.json
}

resource "aws_iam_group_policy_attachment" "group_policy_attribute" {
	count = length(var.target_attribute) != 0 ? 1 : 0

	group = var.group_name
	policy_arn = aws_iam_policy.policy_attribute[count.index].arn
}

resource "aws_iam_group_policy_attachment" "group_policy_read" {
    count = var.read ? 1 : 0

    group = var.group_name
    policy_arn = aws_iam_policy.policy_w[count.index].arn
}

resource "aws_iam_group_policy_attachment" "group_policy_write" {
    count =  var.write ? 1 : 0

    group = var.group_name
    policy_arn = aws_iam_policy.policy_r[count.index].arn
}
