/*
 * Make sure that you use the latest version of the module by changing the
 * `ref=` value in the `source` attribute to the latest version listed on the
 * releases page of this repository.
 *
 */
module "example_sns_topic" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-sns-topic?ref=4.1"

  team_name          = "example-team"
  topic_display_name = "example-topic-display-name"

  providers = {
    aws = aws.london
  }
}

resource "kubernetes_secret" "example_sns_topic" {
  metadata {
    name      = "my-topic-sns-user"
    namespace = "example_namespace"
  }

  data = {
    access_key_id     = module.example_sns_topic.access_key_id
    secret_access_key = module.example_sns_topic.secret_access_key
    topic_arn         = module.example_sns_topic.topic_arn
  }
}

