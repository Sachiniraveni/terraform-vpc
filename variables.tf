//variable "access_key" {
//  default = "AKIAVOMFW7T3JKP3MWG3"
//}
//variable "secret_key" {
//  default = "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"
//}
//variable "region" {
//  default = "ap-south-1"
//}
variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default     = "10.1.0.0/16"
}
variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  default     = "10.1.0.0/24"
}
variable "availability_zone" {
  description = "availability zone to create subnet"
  default     = "ap-south-1a"
}
//variable "public_key_path" {
//  description = "Public key path"
//  default     = "new1"
//}
variable "instance_ami" {
  description = "AMI for aws EC2 instance"
  default     = "ami-0e306788ff2473ccb"
}
variable "instance_type" {
  description = "type for aws EC2 instance"
  default     = "t2.micro"
}
variable "environment_tag" {
  description = "Environment tag"
  default     = "Production"
}