module "example" {
  source                   = "./.."
  role_name_prefix         = "TestEKSRole"
  role_description         = "Role to test the eks role module"
  provider_url             = "https://example.com/id"
  role_policy_arns         = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  cluster_service_accounts = ["mynamespace:test", "anotherns:testalso"]
}
