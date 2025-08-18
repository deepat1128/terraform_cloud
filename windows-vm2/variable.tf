
variable "resource_group_name" {}
variable "location" {
  default = "East US"
}
variable "vm_name" {}
variable "admin_username" {}
variable "admin_password" {
  sensitive = true
}
