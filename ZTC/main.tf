########################################
# Custom ZIA Forwarding Gateway
########################################
resource "ztc_forwarding_gateway" "custom" {
  name             = var.gateway_name
  description      = var.gateway_description
  fail_closed      = var.gateway_fail_closed
  primary_type     = var.gateway_primary_type
  secondary_type   = var.gateway_secondary_type
  manual_primary   = var.gateway_manual_primary
  manual_secondary = var.gateway_manual_secondary
  type             = "ZIA"
}

########################################
# Source IP Group
########################################
resource "ztc_ip_source_groups" "src_group" {
  name         = var.src_ip_group_name
  description  = var.src_ip_group_description
  ip_addresses = var.src_ip_group_addresses
}

########################################
# Optional lookups
########################################
data "ztc_location_management" "this" {
  count = var.location_name != null ? 1 : 0
  name  = var.location_name
}

data "ztc_network_services" "this" {
  count = var.network_service_name != null ? 1 : 0
  name  = var.network_service_name
}

data "ztc_network_service_groups" "this" {
  count = var.network_service_group_name != null ? 1 : 0
  name  = var.network_service_group_name
}

########################################
# Traffic Forwarding Rule (ZIA)
########################################
resource "ztc_traffic_forwarding_rule" "this" {
  name           = var.rule_name
  description    = var.rule_description
  order          = var.rule_order
  rank           = var.rule_rank
  state          = var.rule_state
  type           = var.rule_type
  forward_method = "ZIA"
  wan_selection  = var.wan_selection

  dynamic "locations" {
    for_each = var.location_name != null ? [1] : []
    content {
      id = [data.ztc_location_management.this[0].id]
    }
  }

  dynamic "nw_services" {
    for_each = var.network_service_name != null ? [1] : []
    content {
      id = [data.ztc_network_services.this[0].id]
    }
  }

  dynamic "nw_service_groups" {
    for_each = var.network_service_group_name != null ? [1] : []
    content {
      id = [data.ztc_network_service_groups.this[0].id]
    }
  }

  src_ip_groups {
    id = [ztc_ip_source_groups.src_group.id]
  }

  proxy_gateway {
    id = ztc_forwarding_gateway.custom.id
  }

  depends_on = [
    ztc_forwarding_gateway.custom,
    ztc_ip_source_groups.src_group
  ]
}