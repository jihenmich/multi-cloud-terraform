variable "aws_region" {
  type = string
  default = "eu-central-1"
}

variable "azure_subscription_id" {
  description = "Azure Subscription Id"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "azure_resource_group" {
  type = string
  default = "rg-24-04-on-michalski-jihen"
}

variable "azure_location" {
  type = string
  default = "Germany West Central"
}