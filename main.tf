

resource "aws_sns_topic" "new_topic" {
  name = "${var.topic_name}"
  display_name = "${var.display_name}" #No more than 10 chars
}