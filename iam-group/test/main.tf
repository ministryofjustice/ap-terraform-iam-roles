module "example" {
  source              = "./.."
  group_name          = "TestGroup"
  permitted_role_arns = ["arn:aws:iam::111111111111:role/TestRole"]
  users = [
    "somebody@example.com"
  ]
}
