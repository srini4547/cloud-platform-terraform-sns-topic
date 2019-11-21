variable "topic_display_name" {
  description = "The display name of your SNS Topic. MUST BE UNDER 10 CHARS"
  type        = string
}

variable "team_name" {
  description = "The name of your team"
  type        = string
}

variable "aws_region" {
  description = "Region into which the resource will be created"
  default     = "eu-west-2"
  type        = string
}
