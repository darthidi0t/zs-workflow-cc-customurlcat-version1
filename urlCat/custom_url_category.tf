########################################
# Lookup existing ZIA Source IP Group
########################################
data "zia_firewall_filtering_ip_source_groups" "src_group" {
  name = var.src_ip_group_name
}

########################################
# Create custom URL category
########################################
resource "zia_url_categories" "custom_urls" {
  configured_name = var.custom_url_category_name
  description     = var.custom_url_category_description
  super_category  = var.custom_url_category_super_category
  urls            = var.custom_url_category_urls
}

########################################
# Allow custom URL category
########################################
resource "zia_url_filtering_rules" "allow_custom_category" {
  name        = var.allow_rule_name
  description = var.allow_rule_description
  state       = var.allow_rule_state
  action      = var.allow_rule_action
  order       = var.allow_rule_order
  protocols   = var.allow_rule_protocols

  url_categories = [
    zia_url_categories.custom_urls.id
  ]

  source_ip_groups {
    id = [data.zia_firewall_filtering_ip_source_groups.src_group.id]
  }

  depends_on = [
    zia_url_categories.custom_urls
  ]
}

########################################
# Block all other categories
########################################
resource "zia_url_filtering_rules" "block_rest" {
  name        = var.block_rule_name
  description = var.block_rule_description
  state       = var.block_rule_state
  action      = var.block_rule_action
  order       = var.block_rule_order
  protocols   = var.block_rule_protocols

  url_categories = var.block_rule_url_categories

  source_ip_groups {
    id = [data.zia_firewall_filtering_ip_source_groups.src_group.id]
  }

  depends_on = [
    zia_url_filtering_rules.allow_custom_category
  ]
}