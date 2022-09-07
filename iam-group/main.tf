# The BoolIfExists condition in the policy attached to this group is to allow
# this role to be assumed via the UI or the CLI using an IAM user's access keys.
# Making cross account access via the CLI protected via MFA complicates auditing
# user access and leads to a jarring user experience that users would try to get
# around. Not having MFA but enforcing role session names (see
# assumable-role-iam-user) was the pragmattic choice.
resource "aws_iam_group" "this" {
  name = var.group_name
}

resource "aws_iam_policy" "this" {
  name        = "${var.group_name}AssumeRoles"
  description = "Policy to grant permission to allow assuming roles"
  policy      = data.aws_iam_policy_document.this.json
  tags        = var.tags
}

data "aws_iam_policy_document" "this" {
  statement {
    sid       = "AllowSTSAssumeRole"
    effect    = "Allow"
    resources = var.permitted_role_arns
    actions   = ["sts:AssumeRole"]
    condition {
      test     = "BoolIfExists"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }
  }
}

resource "aws_iam_group_policy_attachment" "this" {
  group      = aws_iam_group.this.name
  policy_arn = aws_iam_policy.this.arn
}

resource "aws_iam_group_membership" "team" {
  name  = "${var.group_name}-membership"
  users = var.users
  group = aws_iam_group.this.name
}
