output "sql_backup_resource_id" {
  value       = jsondecode(azurerm_resource_group_template_deployment.registerbackupsqlvm.output_content).resourceID.value
  description = "Resource ID of the sql backup association"
}

output "image_template_resource_id" {
  value       = jsondecode(azurerm_resource_group_template_deployment.autobackupsqlvm.output_content).resourceID.value
  description = "Resource ID of the auto sql backup association"
}
