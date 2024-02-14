variable "region" {
  type    = string
  default = "ap-south-1"
}
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "node_desired_size" {
  default = 2
  type = number
}
variable "cluster_name" {
  default = "demo"
  type = string
  description = "AWS EKS CLuster Name"
}
