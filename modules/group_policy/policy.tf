data "aws_iam_policy_document" "DynamoDB_Target_READ"{ //Basic DB READ on targeted attribute
    statement{

    effect = "Allow"

    actions = [
        "dynamodb:Scan",
        "dynamodb:Query"
    ]

    resources = [
        "arn:aws:dynamodb:${var.region}:${var.account_id}:table/parsley"
    ]

    condition {
        test = "ForAllValues:StringEquals"
        variable = "dynamodb:Attributes"
        values = [
            var.target_attribute
        ]
    }

    }
}

data "aws_iam_policy_document" "DynamoDB_READ"{ //Basic DB READ
    statement{

    effect = "Allow"

    actions = [
        "dynamodb:Scan",
        "dynamodb:Query"
    ]

    resources = [
        "arn:aws:dynamodb:${var.region}:${var.account_id}:table/parsley"
    ]
    }
}


data "aws_iam_policy_document" "DynamoDB_WRITE"{ //Basic DB Write

    statement{

    actions = [
        "dynamodb:PutItem"
    ]

    resources = [
        "arn:aws:dynamodb:${var.region}:${var.account_id}:table/parsley"
    ]

    }
}