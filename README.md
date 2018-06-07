# cloud-platform-terraform-sns module

Terraform module that will create an SNS Topic in AWS, along with an IAM User to access it.

## Usage

```hcl
module "example_sns_topic" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-sns?ref=master"

  team_name          = "example-repo"
  namespace          = "example-namespace"
  topic_name         = "example-topic-name"
  topic_display_name = "example-topic-display-name"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| team_name |  | string | - | yes |
| namespace | The namespace in which your secrets file will be deployed | string | - | yes |
| topic_name | The name of your SNS Topic | string | - | yes |
| topic_display_name | The display name of your SNS Topic. MUST BE UNDER 10 CHARS | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| topic_arn | ARN for the topic |
| iam_name | Name of IAM user that has been created |
| iam_arn | ARN of IAM user that has been created |
| iam_unique_id | Unique ID of IAM user that has been created |
| iam_access_key_id | The access key ID |
| iam_access_key_secret | The secret access key ID |
