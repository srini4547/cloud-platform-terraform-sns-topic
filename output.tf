output "topic_arn" {
  description = "ARN for the topic"
  value       = "${aws_sns_topic.new_topic.arn}"
}