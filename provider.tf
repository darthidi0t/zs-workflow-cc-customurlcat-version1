terraform {
  required_version = ">= 1.3.0"

  required_providers {
    zia = {
      version = "~> 4.0.0"
      source  = "zscaler/zia"
    }
    ztc = {
      source  = "zscaler/ztc"
      version = "~> 0.1.8"
    }
  }
}

provider "zia" {
  client_id     = var.client_id
  client_secret = var.client_secret
  vanity_domain = var.vanity_domain
  zscaler_cloud = var.zscaler_cloud
}

provider "ztc" {
  # Fill these from env vars or terraform.tfvars
  client_id     = var.ztc_client_id
  client_secret = var.ztc_client_secret
  vanity_domain = var.ztc_vanity_domain
  #  cloud         = var.ztc_cloud
}