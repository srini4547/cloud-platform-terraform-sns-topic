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
    name      = "${module.example_sns_topic.topic_name}-sns-user"
    namespace = "example_namespace"
  }

  data {
    user_name         = "${module.example_sns_topic.iam_name}"
    access_key_id     = "${module.example_sns_topic.iam_access_key_id}"
    secret_access_key = "${module.example_sns_topic.iam_secret_access_key}"
    topic_arn         = "${module.example_sns_topic.topic_arn}"
  }
}
