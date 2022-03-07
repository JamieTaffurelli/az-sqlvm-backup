variable "recovery_services_vault_resource_group_name" {
  type        = string
  description = "Resource Group name of the recovery services vault"
}

variable "recovery_services_vault_name" {
  type        = string
  description = "Name of the recovery services vault to backup to"
}

variable "location" {
  type        = string
  description = "Location to deploy to"
}

variable "virtual_machine_name" {
  type        = string
  description = "Name of virtual machine to back up"
}

variable "virtual_machine_resource_group_name" {
  type        = string
  description = "Resource Group name of virtual machine to back up"
}

variable "backup_policy_name" {
  type        = string
  default     = "VMBackupPolicy"
  description = "Name of VM backup policy to attach VM to"
}

variable "sql_backup_policy_name" {
  type        = string
  default     = "HourlyLogBackup"
  description = "Name of SQL backup policy to attach VM to"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply"
}
