# example AWS SNS with IAM User Creation

Configuration in this directory creates an example AWS SNS Topic and creates an IAM User with permissions to interact with the Topic.

This example outputs an SNS Topic and a new IAM User.

This also contains the functionality to deploy IAM secrets to a Namespace.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` when you want to destroy these resources created.
