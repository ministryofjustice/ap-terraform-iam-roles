module "example" {
  source       = "./.."
  provider_url = "https://token.actions.githubusercontent.com"
  trusted_org_repos = [
    "trustedorg:repo",
    "anotherorg:anotherrepo"
  ]
  role_name_prefix = "TestGitHubFederatedIDRole"
  role_description = "Role to test github-action-federated-id role"
  role_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}
