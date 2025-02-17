#################################################################
# Data sources
#################################################################
data "aws_partition" "current" {}

# Fetch current identity for account ID
data "aws_caller_identity" "current" {}

# Fetch current AWS region
data "aws_region" "current" {}


data "vault_aws_access_credentials" "creds" {
  backend = var.vault_backend
  role    = var.vault_approle
}

data "aws_kms_key" "encryption" {
  key_id = var.kms_key_id
}

data "aws_kms_alias" "encryption_alias" {
  name = var.kms_key_alias
}

data "aws_wafv2_web_acl" "wmpor_waf" {
  name  = var.api_acl_name
  scope = "REGIONAL"
}

# Lookup the Route 53 zone
data "aws_route53_zone" "default" {
  name         = var.custom_domain_hosted_zone
  private_zone = false
}

# Lookup the acm certificate
data "aws_acm_certificate" "certificate" {
  domain      = var.custom_domain_hosted_zone
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}
