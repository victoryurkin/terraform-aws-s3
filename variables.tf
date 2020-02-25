########################################################
# Tags
########################################################

variable client_name {
  description = "Name of the client"
  type        = string
}

variable environment {
  description = "Name of the environment in which the resource is provisioned"
  type        = string
}

variable aws_region {
  description = "(Optional) If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee."
  type        = string
}

variable provisioning {
  description = "Is it manually provisioned or using terraform?"
  type        = string
  default     = "terraform"
}

variable defcon_level {
  description = "Level of distress!"
  type        = string
  default     = "0"
}

variable propagate_at_launch {
  description = "Propogate at launch"
  type        = bool
  default     = true
}

########################################################
# General
########################################################

variable "bucket_name" {
  description = "(Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null
}

variable "bucket_prefix" {
  description = "(Optional, Forces new resource) Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket."
  type        = string
  default     = null
}

variable "acl" {
  description = "(Optional) The canned ACL to apply. Defaults to 'private'."
  type        = string
  default     = "private"
}

variable "policy" {
  description = "(Optional) A valid bucket policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

variable "force_destroy" {
  description = "(Optional, Default:false ) A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  type        = bool
  default     = false
}

variable "website" {
  description = "Map containing static web-site hosting or redirect configuration."
  type        = map(string)
  default     = {}
}

variable "cors_rule" {
  description = "Map containing a rule of Cross-Origin Resource Sharing."
  type        = any # should be `map`, but it produces an error "all map elements must have the same type"
  default     = {}
}

variable "versioning" {
  description = "Map containing versioning configuration."
  type        = map(string)
  default     = { enabled = true }
}

variable "logging" {
  description = "Map containing access bucket logging configuration."
  type        = map(string)
  default     = {}
  //  Example:
  //  With default logging enable on the same bucket, on folder log/
  //  default   = {
  //    target_bucket = "${aws_s3_bucket.log_bucket.id}"
  //    target_prefix = "log/"
  //  }
}

variable "lifecycle_rule_enabled" {
  description = "Enable lifecycle events on this bucket."
  type        = bool
  default     = false
}

variable "block_public_policy" {
  description = "(Optional) Whether Amazon S3 should block public bucket policies for this bucket."
  type        = bool
  default     = true
}

variable "block_public_acls" {
  description = "(Optional) Whether Amazon S3 should block public ACLs for this bucket."
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "(Optional) Whether Amazon S3 should ignore public ACLs for this bucket."
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "(Optional) Whether Amazon S3 should restrict public bucket policies for this bucket."
  type        = bool
  default     = true
}

variable "sse_algorithm" {
  description = "Map containing server-side encryption configuration."
  type        = string
  default     = "AES256"
}

variable "noncurrent_version_expiration_days" {
  description = "Specifies when noncurrent object versions expire"
  default     = 90
}

variable "noncurrent_version_transition_days" {
  description = "Specifies when noncurrent object versions transitions"
  default     = 30
}

variable "standard_transition_days" {
  description = "Number of days to persist in the standard storage tier before moving to the infrequent access tier"
  default     = 30
}

variable "glacier_transition_days" {
  description = "Number of days after which to move the data to the glacier storage tier"
  default     = 60
}

variable "expiration_days" {
  description = "Number of days after which to expunge the objects"
  default     = 90
}
