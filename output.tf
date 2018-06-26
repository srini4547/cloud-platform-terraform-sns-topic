output "topic_name" {
  description = "ARN for the topic"
  value       = "${aws_sns_topic.new_topic.name}"
}

output "topic_arn" {
  description = "ARN for the topic"
  value       = "${aws_sns_topic.new_topic.arn}"
}

output "iam_name" {
  description = "Name of IAM user that has been created"
  value       = "${aws_iam_user.new_topic_iam.name}"
}

output "iam_arn" {
  description = "ARN of IAM user that has been created"
  value       = "${aws_iam_user.new_topic_iam.arn}"
}

output "iam_access_key_id" {
  description = "The access key ID"
  value       = "${aws_iam_access_key.new_topic_iam_access_key.id}"
}

output "iam_secret_access_key" {
  description = "The secret access key ID"
  value       = "${aws_iam_access_key.new_topic_iam_access_key.secret}"
}
