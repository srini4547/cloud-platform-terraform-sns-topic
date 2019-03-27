variable "topic_display_name" {
  description = "The display name of your SNS Topic. MUST BE UNDER 10 CHARS"
}

variable "team_name" {
  description = "The name of your team"
}

variable "aws_region" {
  description = "Region into which the resource will be created"
  default     = "eu-west-2"
}
