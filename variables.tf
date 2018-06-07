variable "topic_name" {
  description = "The name of your SNS Topic"
}

variable "display_name" {
  description = "The display name of your SNS Topic. MUST BE UNDER 10 CHARS"
}

variable "team_name" {
  description = "The name of your team"
}

variable "cluster_namespace" {
  description = "Your namespace within the cluster that you wish to deploy to."
}
