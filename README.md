# cloud-platform-terraform-sns-topic

Terraform module that will create an SNS Topic in AWS, along with an IAM User to access it.

## Usage

```hcl
module "example_sns_topic" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-sns"

  team_name          = "example-repo"
  topic_display_name = "example-topic-display-name"
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
