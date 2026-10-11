resource "google_dns_managed_zone_iam_binding" "dns_managed_zone_iam_bindings" {
  for_each = var.dns_managed_zone_iam_bindings

  managed_zone = each.value.managed_zone
  members      = each.value.members
  role         = each.value.role
  project      = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

