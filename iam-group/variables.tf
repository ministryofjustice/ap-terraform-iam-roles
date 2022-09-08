variable "group_name" {
  description = "The name of the group"
  type        = string
}

variable "permitted_role_arns" {
  description = "List of role ARNs that this group is permitted to assume"
  type        = list(string)
}

variable "users" {
  description = "List of users who are members of this group"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to add to IAM role resources"
  type        = map(string)
  default     = {}
}
