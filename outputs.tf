output "frontend_url" {
  description = "Public URL of the frontend app"
  value       = "http://${azurerm_container_group.frontend.fqdn}"
}
