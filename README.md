# Azure SQL backup to Recovery Services Vault

This repo contains a [Terraform](https://www.terraform.io/) module that registers an Azure SQL virtual machine with a Recovery Services Vault and auto registers all databases for backup.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.2.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_backup_protected_vm.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_protected_vm) | resource |
| [azurerm_resource_group_template_deployment.autobackupsqlvm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_template_deployment) | resource |
| [azurerm_resource_group_template_deployment.registerbackupsqlvm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_template_deployment) | resource |
| [azurerm_backup_policy_vm.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/backup_policy_vm) | data source |
| [azurerm_recovery_services_vault.backup](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/recovery_services_vault) | data source |
| [azurerm_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_machine) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_policy_name"></a> [backup\_policy\_name](#input\_backup\_policy\_name) | Name of VM backup policy to attach VM to | `string` | `"VMBackupPolicy"` | no |
| <a name="input_location"></a> [location](#input\_location) | Location to deploy to | `string` | n/a | yes |
| <a name="input_recovery_services_vault_name"></a> [recovery\_services\_vault\_name](#input\_recovery\_services\_vault\_name) | Name of the recovery services vault to backup to | `string` | n/a | yes |
| <a name="input_recovery_services_vault_resource_group_name"></a> [recovery\_services\_vault\_resource\_group\_name](#input\_recovery\_services\_vault\_resource\_group\_name) | Resource Group name of the recovery services vault | `string` | n/a | yes |
| <a name="input_sql_backup_policy_name"></a> [sql\_backup\_policy\_name](#input\_sql\_backup\_policy\_name) | Name of SQL backup policy to attach VM to | `string` | `"HourlyLogBackup"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply | `map(string)` | n/a | yes |
| <a name="input_virtual_machine_name"></a> [virtual\_machine\_name](#input\_virtual\_machine\_name) | Name of virtual machine to back up | `string` | n/a | yes |
| <a name="input_virtual_machine_resource_group_name"></a> [virtual\_machine\_resource\_group\_name](#input\_virtual\_machine\_resource\_group\_name) | Resource Group name of virtual machine to back up | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_image_template_resource_id"></a> [image\_template\_resource\_id](#output\_image\_template\_resource\_id) | Resource ID of the auto sql backup association |
| <a name="output_sql_backup_resource_id"></a> [sql\_backup\_resource\_id](#output\_sql\_backup\_resource\_id) | Resource ID of the sql backup association |
<!-- END_TF_DOCS -->