data "azurerm_virtual_machine" "vm" {
  name                = var.virtual_machine_name
  resource_group_name = var.virtual_machine_resource_group_name
}

data "azurerm_recovery_services_vault" "backup" {
  name                = var.recovery_services_vault_name
  resource_group_name = var.recovery_services_vault_resource_group_name
}

data "azurerm_backup_policy_vm" "vm" {
  name                = var.backup_policy_name
  recovery_vault_name = var.recovery_services_vault_name
  resource_group_name = var.recovery_services_vault_resource_group_name
}

resource "azurerm_backup_protected_vm" "vm" {
  resource_group_name = var.recovery_services_vault_resource_group_name
  recovery_vault_name = var.recovery_services_vault_name
  source_vm_id        = data.azurerm_virtual_machine.vm.id
  backup_policy_id    = data.azurerm_backup_policy_vm.vm.id
}

resource "azurerm_resource_group_template_deployment" "registerbackupsqlvm" {
  name                = "register-sql-${var.virtual_machine_name}"
  resource_group_name = var.recovery_services_vault_resource_group_name
  template_content    = file("az-sqlvm-backup\\arm\\registerSqlVMBackup.json")
  parameters_content = jsonencode({
    "recoveryServicesVaultName" = {
      value = var.recovery_services_vault_name
    },
    "vmResourceGroupName" = {
      value = var.virtual_machine_resource_group_name
    },
    "vmName" = {
      value = var.virtual_machine_name
    },
    "location" = {
      value = var.location
    },
    "tags" = {
      value = var.tags
    }
  })
  deployment_mode = "Incremental"
}

resource "azurerm_resource_group_template_deployment" "autobackupsqlvm" {
  name                = "auto-backup-sql-${var.virtual_machine_name}"
  resource_group_name = var.recovery_services_vault_resource_group_name
  template_content    = file("az-sqlvm-backup\\arm\\registerSqlVMDatabaseAutoBackup.json")
  parameters_content = jsonencode({
    "recoveryServicesVaultName" = {
      value = var.recovery_services_vault_name
    },
    "backupPolicyName" = {
      value = var.sql_backup_policy_name
    },
    "vmResourceGroupName" = {
      value = var.virtual_machine_resource_group_name
    },
    "vmName" = {
      value = var.virtual_machine_name
    },
    "location" = {
      value = var.location
    },
    "tags" = {
      value = var.tags
    }
  })
  deployment_mode = "Incremental"
  depends_on      = [azurerm_resource_group_template_deployment.registerbackupsqlvm]
}