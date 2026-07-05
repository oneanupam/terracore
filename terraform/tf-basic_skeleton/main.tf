// Resource block to enable google apis
resource "google_project_service" "enable_api" {
  count = length(var.enable_apis)

  project            = var.project_id
  service            = var.enable_apis[count.index]
  disable_on_destroy = false
}
