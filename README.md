# cloud-platform-terraform-sns-topic

[![Releases](https://img.shields.io/github/release/ministryofjustice/cloud-platform-terraform-sns-topic.svg)](https://github.com/ministryofjustice/cloud-platform-terraform-sns-topic/releases)

Terraform module that will create an SNS Topic in AWS, along with an IAM User to access it.

## Usage

```hcl
module "example_sns_topic" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-sns?ref=version"

  team_name          = "example-team"
  topic_display_name = "example-topic-display-name"
  
  providers = {
    aws = aws.london
  }
}
```

## SQS Subscription

For an SQS queue defined in the same namespace's /resources, a subscription can be added with a syntax like

```hcl
resource "aws_sns_topic_subscription" "example-queue-subscription" {
  provider      = "aws.london"
  topic_arn     = "${module.example_sns_topic.topic_arn}"
  protocol      = "sqs"
  endpoint      = "${module.example_sqs.sqs_arn}"
  filter_policy = "{\"field_name\": [\"string_pattern\", \"string_pattern\", \"...\"]}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| team_name |  | string | - | yes |
| topic_display_name | The display name of your SNS Topic. MUST BE UNDER 10 CHARS | string | - | yes |
| aws_region | Region (ex: eu-west-2) | string | eu-west-2 | no |


## Outputs

| Name | Description |
|------|-------------|
| topic_name | The generated name for the SNS topic |
| topic_arn | ARN for the topic |
| access_key_id | The access key ID |
| access_key_secret | The secret access key ID |
