variable "aws_region" {
  description = "AWS Region"
  type        = string
  sensitive   = true
}

variable "aws_backend" {
  description = "AWS Backend name"
  type        = string
  sensitive   = true
}
