data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}

locals {
  provider_url_normalised = replace(var.provider_url, "https://", "")
}

data "aws_iam_policy_document" "assume_role_with_oidc" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = ["arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${local.provider_url_normalised}"]
    }
    condition {
      test     = "StringEquals"
      variable = "${local.provider_url_normalised}:sub"
      values   = [for s in var.cluster_service_accounts : "system:serviceaccount:${s}"]
    }
  }
}

resource "aws_iam_role" "this" {
  assume_role_policy    = data.aws_iam_policy_document.assume_role_with_oidc.json
  description           = var.role_description
  force_detach_policies = var.force_detach_policies
  max_session_duration  = var.max_session_duration
  name                  = var.role_name
  name_prefix           = var.role_name_prefix
  path                  = var.role_path
  permissions_boundary  = var.role_permissions_boundary_arn
  tags                  = var.tags
}

resource "aws_iam_role_policy_attachment" "this" {
  count = length(var.role_policy_arns)

  role       = aws_iam_role.this.name
  policy_arn = element(var.role_policy_arns, count.index)
}
