// rgroup-N01657087/variables.tf

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location/region where the resource group is created"
  type        = string

}

variable "assignment" {
  description = "Assignment tag value"
  type        = string
  default     = "CCGC 5502 Automation Project"
}

variable "name" {
  description = "Name tag value"
  type        = string
  default     = "ashna.paul"
}

variable "expiration_date" {
  description = "Expiration date tag value"
  type        = string
  default     = "2024-12-31"
}

variable "environment" {
  description = "Environment tag value"
  type        = string
  default     = "Project"
}


