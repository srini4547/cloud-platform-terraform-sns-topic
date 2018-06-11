provider "aws" {
  region = "eu-west-1"
}

module "example_sns_topic" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-sns-topic?ref=master"

  team_name          = "example-repo"
  topic_name         = "example-topic-name"
  topic_display_name = "example-topic-display-name"
}

resource "kubernetes_secret" "example_k8_iam_secrets" {
  metadata {
    name      = "${aws_iam_user.new_topic_iam.name}-sns-user-secret"
    namespace = "example_namespace"
  }

  data {
    user_name         = "${aws_iam_user.new_topic_iam.name}"
    access_key_id     = "${aws_iam_access_key.new_topic_iam_access_key.id}"
    secret_access_key = "${aws_iam_access_key.new_topic_iam_access_key.secret}"
    topic_arn         = "${aws_sns_topic.new_topic.arn}"
  }
}
