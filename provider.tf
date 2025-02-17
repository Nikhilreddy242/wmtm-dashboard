
terraform {
  required_providers {
    aws = {
      version = ">=5.0"
    }
  }
}

terraform {
  cloud { 
    organization = "Regions-Bank"
	workspaces {}
  }
}

# Vault provider - source of all AWS credentials
provider "vault" {
  address          = var.vault_address
  namespace        = var.vault_namespace
  skip_child_token = true
  auth_login {
    namespace = var.vault_namespace
    path      = var.vault_auth_path
    parameters = {
      role_id   = var.vault_role_id
      secret_id = var.vault_secret_id
    }
  }
}

##########################################################
#  AWS
##########################################################
provider "aws" {
  allowed_account_ids     = ["867344475630"]
  region                  = "us-east-1"
  access_key              = data.vault_aws_access_credentials.creds.access_key
  secret_key              = data.vault_aws_access_credentials.creds.secret_key
  skip_metadata_api_check = true
  default_tags {
    tags = {
      Cost_Center    = "M001109403"
      Application_CI = "wmtm"
      Owner          = "WealthApplicationDevelopment@regions.com"
      Environment    = "dev"
      TFE_Workspace  = "Regions-AppDev/${terraform.workspace}"
      GH_Repo        = "/regions-appdev/wmtm-repository"
    }
  }
}
