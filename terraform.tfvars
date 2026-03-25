ztc_client_id     = "<enter client id from ZID>"
ztc_client_secret = "<enter client secret from ZID>"
ztc_vanity_domain = "<enter ZID Vanity Domain>"
ztc_cloud         = "PRODUCTION"

#############################
# ZIA Tenant Credentials
#############################

client_id     = "<enter client id from ZID>"
client_secret = "<enter client secret from ZID>"
vanity_domain = "<enter ZID Vanity Domain>"
zscaler_cloud = "PRODUCTION"

gateway_name             = "CC-Custom-GW-03"
gateway_description      = "Custom forwarding gateway"
gateway_fail_closed      = true
gateway_primary_type     = "MANUAL_OVERRIDE"
gateway_secondary_type   = "MANUAL_OVERRIDE"
gateway_manual_primary   = "1.1.1.3"
gateway_manual_secondary = "2.2.2.3"


rule_name        = "CC-Traffic-Rule-03"
rule_description = "Traffic forwarding rule using custom gateway"
rule_order       = 1
rule_rank        = 2
rule_state       = "ENABLED"
rule_type        = "EC_RDR"

wan_selection = "BALANCED_RULE"
########################################
# Optional
########################################
location_name              = null
network_service_name       = null
network_service_group_name = null

########################################
# Source IP Group
########################################
src_ip_group_name        = "Azure-VNET-SRC-IP-Pool-7"
src_ip_group_description = "ZIA source IP group for URL filtering"
src_ip_group_addresses = [
  "192.168.7.0/24",
  "172.16.7.0/24"
]

########################################
# ZIA Custom URL Category Vars
########################################

zia_src_ip_group_name        = "Azure-VNET-SRC-IP-Pool-7"
zia_src_ip_group_description = "ZIA source IP group for URL filtering"
zia_src_ip_group_addresses = [
  "192.168.7.0/24",
  "172.16.7.0/24"
]


custom_url_category_name        = "Custom-Acme-Bank-URLs-7"
custom_url_category_description = "Custom URL category for Acme AWS and Bank API domains"

custom_url_category_urls = [
  ".acme7.aws.com",
  ".api7.bank.com"
]

allow_rule_name        = "Allow-Custom-Acme-Bank-URLs-7"
allow_rule_description = "Allow custom category for Azure source IP group"
allow_rule_order       = 1

block_rule_name        = "Block-All-Other-URLs-7"
block_rule_description = "Block all other categories for Azure source IP group"
block_rule_order       = 2