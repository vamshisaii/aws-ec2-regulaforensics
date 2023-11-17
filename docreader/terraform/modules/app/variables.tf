variable "name" {
  description = "Application name to deploy"
  type        = string
}

variable "environment" {
  description = "Environment to deploy"
  type        = string
}

variable "region" {
  description = "AWS Region to deploy"
  default     = "eu-central-1"
  type        = string
}

variable "vpc_network" {
  description = "VPC network octet"
  default     = "10.11"
  type        = string
}

variable "domain" {
  description = "Certificate's domain"
  default     = "*.example.com"
  type        = string
}

variable "asg_min_size" {
  description = "ASG Minimum size of the Auto Scaling Group"
  default     = 1
  type        = number
}

variable "asg_max_size" {
  description = "ASG Maximum size of the Auto Scaling Group"
  default     = 4
  type        = number
}

variable "asg_desired_capacity" {
  description = "ASG Number of Amazon EC2 instances that should be running in the group"
  default     = 1
  type        = number
}

variable "asg_on_demand_base_capacity" {
  description = "ASG Absolute minimum amount of desired capacity that must be fulfilled by on-demand instances"
  default     = 0
  type        = number
}

variable "asg_on_demand_percentage_above_base_capacity" {
  description = "ASG Percentage split between on-demand and Spot instances above the base on-demand capacity"
  default     = 0
  type        = number
}

variable "docreader_instance_type" {
  description = "Docreader worker Instance type to deploy"
  type        = string
  default     = "c6a.large"
}

variable "worker_count" {
  description = "Docreader workers count"
  default     = 1
  type        = number
}

variable "backlog" {
  description = "Docreader backlog size"
  default     = 20
  type        = number
}

variable "create_schedule" {
  description = "Determines whether to create autoscaling group schedule or not"
  type        = bool
  default     = true
}
