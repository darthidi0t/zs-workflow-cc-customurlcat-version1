########################################
# Provider Auth
########################################
variable "ztc_client_id" {
  type      = string
  sensitive = true
}

variable "ztc_client_secret" {
  type      = string
  sensitive = true
}

variable "ztc_vanity_domain" {
  type = string
}

variable "ztc_cloud" {
  type    = string
  default = "beta"
}


variable "client_id" {
  description = "OneAPI User ID"
  type        = string
}

variable "client_secret" {
  description = "OneAPI Client Secret"
  type        = string
  sensitive   = true
}

variable "vanity_domain" {
  description = "Zidentity vanity domain"
  type        = string
  sensitive   = true
}

variable "zscaler_cloud" {
  description = "Zscaler cloud name"
  type        = string
}
########################################
# Gateway Variables
########################################
variable "gateway_name" {
  type = string
}

variable "gateway_description" {
  type = string
}

variable "gateway_fail_closed" {
  type    = bool
  default = true
}

variable "gateway_primary_type" {
  type    = string
  default = "MANUAL_OVERRIDE"
}

variable "gateway_secondary_type" {
  type    = string
  default = "MANUAL_OVERRIDE"
}

variable "gateway_manual_primary" {
  type = string
}

variable "gateway_manual_secondary" {
  type = string
}

########################################
# Source IP Group Variables
########################################
variable "src_ip_group_name" {
  type = string
}

variable "zia_src_ip_group_name" {
  type = string
}

variable "zia_src_ip_group_addresses" {
  type = list(string)
}

variable "zia_src_ip_group_description" {
  type = string
}

variable "src_ip_group_description" {
  type = string
}

variable "src_ip_group_addresses" {
  type = list(string)
}

########################################
# Traffic Rule Variables
########################################
variable "rule_name" {
  type = string
}

variable "rule_description" {
  type = string
}

variable "rule_order" {
  type    = number
  default = 1
}

variable "rule_rank" {
  type    = number
  default = 7
}

variable "rule_state" {
  type    = string
  default = "ENABLED"
}

variable "rule_type" {
  type    = string
  default = "EC_RDR"
}

variable "dest_addresses" {
  type    = list(string)
  default = []
}

variable "dest_countries" {
  type    = list(string)
  default = []
}

variable "wan_selection" {
  type    = string
  default = "BALANCED_RULE"
}

########################################
# Optional Lookups
########################################
variable "location_name" {
  type    = string
  default = null
}

variable "network_service_name" {
  type    = string
  default = null
}

variable "network_service_group_name" {
  type    = string
  default = null
}

########################################
# ZIA Custom URL Category Variables
########################################

#variable "zia_src_ip_group_name" {
#  type = string
#}

variable "custom_url_category_name" {
  type = string
}

variable "custom_url_category_description" {
  type = string
}

variable "custom_url_category_super_category" {
  type    = string
  default = "USER_DEFINED"
}

variable "custom_url_category_urls" {
  type = list(string)
}

variable "allow_rule_name" {
  type = string
}

variable "allow_rule_description" {
  type = string
}

variable "allow_rule_state" {
  type    = string
  default = "ENABLED"
}

variable "allow_rule_action" {
  type    = string
  default = "ALLOW"
}

variable "allow_rule_order" {
  type = number
}

variable "allow_rule_protocols" {
  type    = list(string)
  default = ["ANY_RULE"]
}

variable "block_rule_name" {
  type = string
}

variable "block_rule_description" {
  type = string
}

variable "block_rule_state" {
  type    = string
  default = "ENABLED"
}

variable "block_rule_action" {
  type    = string
  default = "BLOCK"
}

variable "block_rule_order" {
  type = number
}

variable "block_rule_protocols" {
  type    = list(string)
  default = ["ANY_RULE"]
}

variable "block_rule_url_categories" {
  type    = list(string)
  default = ["ANY"]
}