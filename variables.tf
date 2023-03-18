variable "certificate_authority_arn" {
  description = "Certificate authority ARN"
  type        = string
  default     = "arn:aws:acm-pca:eu-west-2:612541004132:certificate-authority/648cd3f4-219f-423f-98f1-067b922c2654"
}

variable "application_name" {
  description = "Name of the application"
  type        = string
  default     = "audit_report"
}
