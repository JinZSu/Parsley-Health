resource "aws_dynamodb_table" "main_table"{
	name = "parsley"
	read_capacity = 5
	write_capacity = 5
	hash_key = "Parsley-1"
	range_key = "Parsley-2"

	stream_enabled = true
	stream_view_type = "NEW_IMAGE"

	attribute {
		name ="Parsley-1"
		type = "S"
	}

	attribute {
		name ="Parsley-2"
		type = "N"
	}
}