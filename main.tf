resource "aws_sns_topic" "new_topic" {
  name         = "${var.topic_name}"
  display_name = "${var.display_name}"
}

resource "aws_iam_user" "new_topic_iam" {
  name = "${var.team_name}-${var.display_name}-topic-user"
}

resource "aws_iam_access_key" "new_topic_iam_access_key" {
  user = "${aws_iam_user.new_topic_iam.name}"
}

data "aws_iam_policy_document" "policy" {
  statement {
    actions = [
      "sns:ListEndpointsByPlatformApplication",
      "sns:ListPlatformApplications",
      "sns:ListSubscriptions",
      "sns:ListSubscriptionsByTopic",
      "sns:ListTopics",
      "sns:CheckIfPhoneNumberIsOptedOut",
      "sns:GetEndpointAttributes",
      "sns:GetPlatformApplicationAttributes",
      "sns:GetSMSAttributes",
      "sns:GetSubscriptionAttributes",
      "sns:GetTopicAttributes",
      "sns:ListPhoneNumbersOptedOut",
      "sns:ConfirmSubscription",
      "sns:CreatePlatformApplication",
      "sns:CreatePlatformEndpoint",
      "sns:CreateTopic",
      "sns:DeleteEndpoint",
      "sns:DeletePlatformApplication",
      "sns:DeleteTopic",
      "sns:OptInPhoneNumber",
      "sns:Publish",
      "sns:SetEndpointAttributes",
      "sns:SetPlatformApplicationAttributes",
      "sns:SetSMSAttributes",
      "sns:SetSubscriptionAttributes",
      "sns:SetTopicAttributes",
      "sns:Subscribe",
      "sns:Unsubscribe",
    ]

    resources = [
      "${aws_sns_topic.new_topic.arn}",
    ]
  }
}

resource "aws_iam_policy" "policy" {
  name        = "${var.topic_name}-sns-topic-policy"
  policy      = "${data.aws_iam_policy_document.policy.json}"
  description = "Policy for SNS}"
}

resource "aws_iam_policy_attachment" "attach-policy" {
  name       = "attached-policy"
  users      = ["${aws_iam_user.new_topic_iam.name}"]
  policy_arn = "${aws_iam_policy.policy.arn}"
}

resource "kubernetes_secret" "k8_iam_secrets" {
  metadata {
    name      = "${aws_iam_user.new_topic_iam.name}-sns-user-secret"
    namespace = "${var.cluster_namespace}"
  }

  data {
    user_name         = "${aws_iam_user.new_topic_iam.name}"
    access_key_id     = "${aws_iam_access_key.new_topic_iam_access_key.id}"
    secret_access_key = "${aws_iam_access_key.new_topic_iam_access_key.secret}"
    topic_arn         = "${aws_sns_topic.new_topic.arn}"
  }
}
