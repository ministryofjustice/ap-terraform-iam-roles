variable "provider_url" {
  description = "URL of the cluster OIDC Provider"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to IAM role resources"
  type        = map(string)
  default     = {}
}

variable "role_name" {
  description = "IAM role name"
  type        = string
  default     = null
}

variable "role_name_prefix" {
  description = "IAM role name prefix"
  type        = string
  default     = null
}

variable "role_description" {
  description = "IAM Role description"
  type        = string
}

variable "role_path" {
  description = "Path of IAM role"
  type        = string
  default     = "/"
}

variable "role_permissions_boundary_arn" {
  description = "Permissions boundary ARN to use for IAM role"
  type        = string
  default     = null
}

variable "max_session_duration" {
  description = "Maximum CLI/API session duration in seconds between 3600 and 43200"
  type        = number
  default     = 3600
}

variable "role_policy_arns" {
  description = "List of ARNs of IAM policies to attach to IAM role"
  type        = list(string)
}

variable "cluster_service_accounts" {
  description = "The service accounts that can assume this role in the form NAMESPACE_NAME:SERVICE_ACCOUNT_NAME e.g. 'kube-system:foo-service'"
  type        = set(string)
}

variable "force_detach_policies" {
  description = "Whether policies should be detached from this role when destroying"
  type        = bool
  default     = true
}
