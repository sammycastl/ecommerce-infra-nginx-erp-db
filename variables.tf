variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
  default     = "12345678-1234-1234-1234-123456789012" # Valor genérico
}

variable "location" {
  type        = string
  description = "Azure region for resources"
  default     = "Central US"
}

variable "environment" {
  type        = string
  description = "Environment (dev, staging, prod)"
  default     = "dev"
}

variable "project" {
  type        = string
  description = "Project name"
  default     = "ecommerce"
}

variable "tags" {
  type        = map(string)
  description = "Tags for all resources"
  default = {
    createdBy = "Nelson Martinez"
    date      = "June-2025"
  }
}

variable "db_admin_username" {
  type        = string
  description = "Database admin username"
  default     = "psqladmin" 
  sensitive   = true
}

variable "db_admin_password" {
  type        = string
  description = "Database admin password"
  sensitive   = true
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key for VM access"
  default     = "" 
}