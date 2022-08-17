module "example" {
  source           = "./.."
  role_name_prefix = "TestFederatedRole"
  trusted_entity_arns = [
    "arn:aws:iam::042130406152:role/GlobalGitHubActionAccess",
    "arn:aws:iam::042130406152:role/restricted-admin"
  ]
  role_description = "Role to test assumable-role-federated-user role"
  role_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}
