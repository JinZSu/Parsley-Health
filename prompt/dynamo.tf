resource "aws_dynamodb_table" "main_table"{
	name = "parsley"
	billing_mode = "PROVISIONED"

	read_capacity = 5
	write_capacity = 5

	stream_enabled = true
	stream_view_type = "NEW_AND_OLD_IMAGES"

	server_side_encryption {
		enabled = true //on by default but good practice to have to write it
	}

	hash_key = "Parsley-1"
	range_key = "Parsley-2"

	attribute {
		name ="Parsley-1"
		type = "S"
	}

	attribute {
		name ="Parsley-2"
		type = "N"
	}
}