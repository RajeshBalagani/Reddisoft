<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.46.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.46.0 |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.audit_bucket](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.audit_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/resources/s3_bucket_policy) | resource |
| [null_resource.run_audit_report](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/data-sources/caller_identity) | data source |
| [aws_iam_account_alias.account_alias](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/data-sources/iam_account_alias) | data source |
| [aws_iam_policy_document.audit_bucket_policy_doc](https://registry.terraform.io/providers/hashicorp/aws/4.46.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | Name of the application | `string` | `"audit_report"` | no |
| <a name="input_certificate_authority_arn"></a> [certificate\_authority\_arn](#input\_certificate\_authority\_arn) | Certificate authority ARN | `string` | `"arn:aws:acm-pca:eu-west-2:612541004132:certificate-authority/648cd3f4-219f-423f-98f1-067b922c2654"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->