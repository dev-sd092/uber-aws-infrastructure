variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "backend_sg_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}

variable "db_endpoint" {
  type = string
}