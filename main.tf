resource "random_id" "id" {
  byte_length = 16
}

// SNS topics do not support tagging, however, the name can be up to 256
// characters so it should be safe to use the team name here for identification.
resource "aws_sns_topic" "new_topic" {
  name         = "cloud-platform-${var.team_name}-${random_id.id.hex}"
  display_name = var.topic_display_name
}

resource "aws_iam_user" "user" {
  name = "cp-sns-topic-${random_id.id.hex}"
  path = "/system/sns-topic-user/${var.team_name}/"
}

resource "aws_iam_access_key" "user" {
  user = aws_iam_user.user.name
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
      "sns:DeleteEndpoint",
      "sns:DeletePlatformApplication",
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
      aws_sns_topic.new_topic.arn,
    ]
  }
}

resource "aws_iam_user_policy" "policy" {
  name   = "sns-topic"
  policy = data.aws_iam_policy_document.policy.json
  user   = aws_iam_user.user.name
}
