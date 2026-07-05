// Resources output
output "enable_apis" {
  value       = google_project_service.enable_api
  description = "The value of the enabled apis in google cloud."
}

output "api_ids" {
  description = "The list of the id of the enabled apis"
  value = [
    for value in google_project_service.enable_api :
    value.id
  ]
}
