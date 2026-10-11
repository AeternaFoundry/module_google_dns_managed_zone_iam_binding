variable "dns_managed_zone_iam_bindings" {
  description = <<EOT
Map of dns_managed_zone_iam_bindings, attributes below
Required:
    - managed_zone
    - members
    - role
Optional:
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    managed_zone = string
    members      = set(string)
    role         = string
    project      = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

