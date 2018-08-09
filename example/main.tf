provider "aws" {
  region = "eu-west-1"
}

module "example_sns_topic" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-sns-topic?ref=master"

  team_name          = "example-team"
  topic_display_name = "example-topic-display-name"
}

resource "kubernetes_secret" "example_k8_iam_secrets" {
  metadata {
    name      = "my-topic-sns-user"
    namespace = "example_namespace"
  }

  data {
    access_key_id     = "${module.example_sns_topic.access_key_id}"
    secret_access_key = "${module.example_sns_topic.secret_access_key}"
    topic_arn         = "${module.example_sns_topic.topic_arn}"
  }
}
