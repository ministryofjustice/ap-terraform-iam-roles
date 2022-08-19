module "example" {
  source             = "./.."
  role_name_prefix   = "TestIAMRole"
  trusted_account_id = "525294151996"
  role_description   = "Role to test assumable-role-IAM-user role"
  role_policy_arns   = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}
