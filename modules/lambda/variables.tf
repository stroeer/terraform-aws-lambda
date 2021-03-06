# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "filename" {
  description = "The path to the function's deployment package within the local filesystem."
}

variable "function_name" {
  description = "A unique name for your Lambda Function."
}

variable "handler" {
  description = "The function entrypoint in your code."
}

variable "runtime" {
  description = "The runtime environment for the Lambda function you are uploading."
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "description" {
  description = "Description of what your Lambda Function does."
  default     = ""
}

variable "environment" {
  description = "Environment (e.g. env variables) configuration for the Lambda function enable you to dynamically pass settings to your function code and libraries"
  type        = map(map(string))
  default     = {}
}

variable "layers" {
  default     = []
  description = "List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function."
  type        = list(string)
}

variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128."
  default     = 128
}

variable "publish" {
  description = "Whether to publish creation/change as new Lambda Function Version. Defaults to false."
  default     = false
}

variable "reserved_concurrent_executions" {
  description = "The amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1."
  default     = "-1"
}

variable "s3_bucket" {
  description = "The S3 bucket location containing the function's deployment package. Conflicts with filename. This bucket must reside in the same AWS region where you are creating the Lambda function."
  default     = ""
}

variable "s3_key" {
  description = " The S3 key of an object containing the function's deployment package. Conflicts with filename."
  default     = ""
}

variable "s3_object_version" {
  description = "The object version containing the function's deployment package. Conflicts with filename."
  default     = ""
}

variable "source_code_hash" {
  description = "Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3_key. The usual way to set this is filebase64sha256('file.zip') where 'file.zip' is the local filename of the lambda function source archive."
  default     = ""
}

variable "tags" {
  description = "A mapping of tags to assign to the Lambda function."
  type        = map(string)
  default     = {}
}

variable "timeout" {
  description = "The amount of time your Lambda Function has to run in seconds. Defaults to 3."
  default     = 3
}

variable "vpc_config" {
  description = "Provide this to allow your function to access your VPC (if both 'subnet_ids' and 'security_group_ids' are empty then vpc_config is considered to be empty or unset, see https://docs.aws.amazon.com/lambda/latest/dg/vpc.html for details)."
  type        = map(list(string))
  default     = {}
}
