variable "project" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "credentials_file" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}


variable "machine_type" {
  type = string
}

variable "machine_image" {
  type = string
}

variable "disk_size" {
  type = number
}

variable "disk_type" {
  type = string
}

variable "startup_script" {
  type = string
}
variable application_user {
    description = "Temporary user to deploy Software"
    default = ""
}

variable "dev" {
  type = string
}

variable "qa" {
  type = string
}
