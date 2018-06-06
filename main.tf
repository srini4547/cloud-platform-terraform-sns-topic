data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_sns_topic" "new_topic" {
  name = "${var.topic_name}"
  display_name = "${var.display_name}" #No more than 10 chars
}

resource "aws_iam_user" "new_topic_iam" {
  name = "${var.team_name}-${var.display_name}-topic-user"
}

resource "aws_iam_access_key" "new_topic_iam_access_key" {
  user    = "${aws_iam_user.new_topic_iam.name}"
}