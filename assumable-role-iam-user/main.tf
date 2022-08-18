data "aws_iam_policy_document" "assume_role" {

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [var.trusted_account_id]
    }
    condition {
      test     = "StringLike"
      variable = "sts:RoleSessionName"
      values   = ["&{aws:username}"]
    }
  }
}

resource "aws_iam_role" "this" {

  assume_role_policy    = data.aws_iam_policy_document.assume_role.json
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