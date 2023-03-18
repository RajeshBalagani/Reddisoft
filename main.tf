data "aws_iam_account_alias" "account_alias" {
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "audit_bucket" {
  bucket = "${data.aws_iam_account_alias.account_alias.account_alias}-audit-bucket-${var.application}"
  acl    = "private"
}

resource "aws_s3_bucket_policy" "audit_bucket_policy" {
  bucket = aws_s3_bucket.audit_bucket.id
  policy = data.aws_iam_policy_document.audit_bucket_policy_doc.json
}

data "aws_iam_policy_document" "audit_bucket_policy_doc" {
  statement {
    sid    = ""
    effect = "Allow"

    resources = [
      "arn:aws:s3:::dwsecops-dev-pki-pcasl-auditreport/*",
      "arn:aws:s3:::dwsecops-dev-pki-pcasl-auditreport",
    ]

    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:GetBucketAcl",
      "s3:GetBucketLocation",
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = ["751541007789794132"]
    }

    principals {
      type        = "Service"
      identifiers = ["acm-pca.amazonaws.com"]
    }
  }
}

resource "null_resource" "run_audit_report" {
  provisioner "local-exec" {
    command = "aws acm-pca create-certificate-authority-audit-report --certificate-authority-arn var.certificate_authority_arn --s3-bucket-name aws_s3_bucket.audit_bucket.id --audit-report-response-format JSON"
  }
}

