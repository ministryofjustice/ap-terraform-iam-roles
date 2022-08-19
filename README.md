# ap-terraform-iam-roles

This repository contains modules that implement IAM role patterns used accross the AP code base.

Previously, these patterns have been implemented multiple times but in slightly different ways.
In some cases that has been achieved by using the Terraform AWS IAM module.
Those implementations are good but often overly complex and hard to debug.

This is an attempt to co-locate all IAM role patterns in a single place, simplify and document them.

It contains:

- `eks-role`: a role that can be assumed by an EKS cluster
- `github-action-role`: a role that can be assumed by GitHub actions in a repo or repos
- `assumable-role-federated-user`: a role that can be assumed by a federated user e.g. an `eks-role`
- `assumable-iam-user`: a role that can be assumed by an IAM user or group in trusted account
