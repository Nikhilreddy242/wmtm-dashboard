variable "environment" {
  type    = string
  default = "dev"
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "application_code" {
  type        = string
  description = "Regions Application Code for wmtm Project"
  default     = "wmtm"
}

variable "aws_account_number" {
  type        = string
  description = "AWS Account Number"
  default     = "867344475630"   #WMTM DEV
}

variable "aws_region" {
  description = "The region to deploy the resources"
  default     = "us-east-1"
  type        = string
}

variable "service_name" {
  description = "The name of the service"
  default     = "wmtm-api"
  type        = string
}

variable "log_level" {
  type        = string
  default     = "DEBUG"
  description = "Application log level for internal api calls"
}

variable "release_version" {
  type        = string
  description = "Release version + commit hash of the currently deployed code"
  default     = "1.0.0-prerelease"
}

variable "db_cluster_identifier" {
  type        = string
}

variable "debug_level" {
  type        = string
}

####################################################################################
############# Seeker Variables #####################################################
####################################################################################
variable "seeker_server_url" {
  type        = string
  description = "Seeker Server url"
  default     = "https://seeker.rgnscloud.com"
}

variable "seeker_composite_project_key" {
  type        = string
  description = "Seeker composite (parent) project key"
  default     = "WMTM-Regions"
}

variable "seeker_enabled" {
  type        = bool
  description = "Is Seeker instrumentation enabled?"
  default     = false
}
####################################################################################

####################################################################################
############# DB Variables #########################################################
####################################################################################
variable "db_schema" {
  description = "Schema of the RDS database"
  default     = "public"
  type        = string
}

variable "db_security_group_name" {
  description = "The name of the security group wrapped around the RDS database.  Required if db_use_shared is set to true."
  default     = ""
  type        = string
}

variable "db_user" {
  description = "Username of the RDS database user that maps to IAM Auth"
  default     = "app_user"
  type        = string
}
####################################################################################

####################################################################################
############# OKTA Variables #######################################################
####################################################################################
variable "okta_issuer" {
  type        = string
  description = "Okta issuer"
}

variable "okta_issuer_internal" {
  type        = string
  description = "Okta internal issuer"
}

variable "okta_audience" {
  type        = string
  description = "Okta audience"
}

variable "okta_audience_internal" {
  type        = string
  description = "Okta internal audience"
}

variable "okta_internal_url" {
  type        = string
  description = "Voltage Okta Internal URL"
  default     = "https://regions-internal-qa.oktapreview.com/oauth2/default/v1"
}

variable "okta_wmtm_api_issuer_url" {
  type        = string
  description = "Okta Issuer URL for wmtm Login"
  default     = "https://regions-internal-qa.oktapreview.com/oauth2/ausdbr17c4BKlRYAf1d7"
}

variable "okta_granttype" {
  type        = string
  description = "Okta grant type"
  default     = "client_credentials"
}

variable "okta_scope" {
  type        = string
  description = "Okta scope"
  default     = "ResourceRead ResourceWrite"
}
####################################################################################

variable "kms_key_alias" {
  description = "The alias of the KMS key to use for encryption."
  default     = "alias/project_wmtm_services"
  type        = string
}

variable "kms_key_id" {
  description = "The alias of the KMS key to use for encryption."
  type        = string
}

variable "tags" {
  type    = any
  default = {}
}

####################################################################################
############# Vault Variables ######################################################
####################################################################################
variable "vault_address" {
  type    = string
  default = "https://vault.rgnscloud.com:8200"
}

variable "vault_auth_role" {
  type        = string
  default     = "lambda-dev_wmtm-api_exec"
  description = "the name of the role in Vault cooresponding the aws authentication config"
}

variable "vault_path" {
  type    = string
  default = "data/dev/api"
}

variable "vault_approle" {
  type    = string
  default = "aws_project_wmtm_dev-role"
}

variable "vault_auth_path" {
  type    = string
  default = "auth/wmtm_prod_approle/login"
}

variable "vault_auth_provider" {
  type        = string
  default     = "wmtm_aws"
  description = "Environment specific namespace for WMTM vault"
}

variable "vault_backend" {
  type    = string
  default = "aws_project_wmtm_dev-credproducer-path"
}

variable "vault_layer_version" {
  description = "The version to use for the lambda vault layer."
  default     = 19
  type        = number
}

variable "vault_namespace" {
  description = "The Vault namespace. Used by the Lambda layer vault login call"
  type        = string
  default     = "wmtm"
}

variable "vault_role_id" {
  type    = string
  default = ""
}

variable "vault_secret_id" {
  type      = string
  sensitive = true
}

variable "vault_store_db_master_password" {
  type    = bool
  default = true
}
####################################################################################

variable "enterprise_notification_delivery_proxy_base_url" {
  description = "Enterprise Notification Delivery (END) proxy URL"
  default     = "https://end-notification-sys-okta-proxy-test-v1.api-np-c.regionsapps.com/EnterpriseNotification/api/Notifications"
  type        = string
}

variable "voltage_enabled" {
  type        = bool
  description = "Voltage feature flag"
  default     = false
}

variable "sdlc_environment" {
  type        = string
  description = "Runtime SDLC environment.  Always the same regardless of region or lane.  dev, qa, stage, or prod."
  default     = "dev"
}

variable "Role_Id" {
  type       = string
  default    = ""
}

variable "Secret_Id" {
  type       = string
  default    = ""
}

variable "private_subnet_tag" {
  description = "The tag for the private subnets with the VPC to deploy private resources in."
  default     = "private"
  type        = string
}

variable "vpc_tag" {
  description = "The tag of the VPC to deploy resources in."
  default     = "vpc-0d5db1bc3570d3433"
  type        = string
}
###################################################################################
variable "vpc_id" {
  type = string
  default = "vpc-0d5db1bc3570d3433"
}

variable "lambda_sg_name" {
  type = string
  default = "wmtm_lambda_sg"
}

variable "lambda_file_path" {
  type = string
  default = ""
}

####################################################################################
############# Lambda Function ######################################################
####################################################################################
variable "wmtm_api_lambda_name" {
  type = string
}

variable "wmtm_api_lambda_migrator_name" {
  type = string
}

variable "lambda_runtime_version" {
  type = string
}

variable "lambda_memory_size" {
  type = number
}

variable "timeout" {
  type = number
}

variable "api_handler" {
  type = string
}

variable "wmtm_lambda_sg_group_name" {
  type = string
}


variable "s3_bucket_name" {
  type = string
}

variable "wmtm_lambda_s3_keyname" {
  type = string
}

variable "wmtm_lambda_s3_ziphash" {
  type = string
}

variable "ASPNETCORE_ENVIRONMENT" {
  type = string
}
#################################################################################
####################### API Gateway #############################################
##########################################################ƒ#######################
variable "api_name" {
  type = string
}

variable "api_gateway_name" {
  type = string
}



variable "log_retention" {
  type = number
}

variable "api_environment" {
  type = string
  default = "dev"
}

variable "lambda_authorizer_name" {
  type = string
  default = "wmtm_api_lambda_authorizer"
}

variable "custom_domain_enabled" {
  description = "If true, uses the custom domain.  If false, uses the apigw built-in"
  default     = true
  type        = bool
}

variable "custom_domain_enabled_migrator" {
  description = "If true, uses the custom domain.  If false, uses the apigw built-in"
  default     = true
  type        = bool
}

variable "custom_domain_hosted_zone" {
  description = "The zone to create records within"
  default     = "wmtm-api.wmtm.rgnscloud-dev.com"
  type        = string
}

# List of API Gateway names to monitor
variable "api_gateway_ids" {
  type    = list(string)
  
}

variable "custom_domain_name" {
  type = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "lambda_functions" {
  description = "List of Lambda function names to create alarms for"
  type        = list(string)
}

variable "alarm_actions" {
  description = "List of SNS topic ARNs to trigger on alarms"
  type        = list(string)
}

variable "lambda_metrics" {
  description = "List of CloudWatch metrics for Lambda"
  type = list(object({
    name               = string
    statistic          = string
    period             = number
    evaluation_periods = number
    threshold          = number
    comparison_operator = string
  }))
}

variable "api_gateway_metrics" {
  description = "List of CloudWatch metrics for API Gateway"
  type = list(object({
    name               = string
    statistic          = string
    period             = number
    evaluation_periods = number
    threshold          = number
    comparison_operator = string
  }))
}

variable "lambda_role_name" {
  type = string
  
}
variable "api_acl_name" {
  type = string
}

variable "function_name_backend_lambda" {
  type = string
  
}

#####################################################################
################### RDS Variables####################################
#####################################################################
variable "cluster_name" {
  type = string
  default = "wmtm-rds-cluster"
  description = "Name of the cluster"
}

variable "rds_prefix"{
  type = string
  default = "wmtm-rds"
  description = "Name of the rds prefix"
}

variable "engine" {
  type = string
  default = "aurora-postgresql"
  description = "Name of the engine"
}

variable "engine_version" {
  type = number
  default = 14.7
  description = "Version for engine"
}

variable "storage_type" {
  type = string
  default = "aurora-iopt1"
  description = "type for storage"
}

variable "identifiers" {
  type = list(string)
  default = [ "wmpor-rds-0", "wmpor-rds-1" ]
  description = "Name of the identifiers"
}

variable "instance_class" {
  type = string
  default = "db.t3.medium"
  description = "Name of the instance"
}

variable "database_name" {
  type = string
  default = "wmporapi"
  description = "Name of the database"
}

variable "database_username" {
  type = string
  default = "dbadmin"
  description = "Username of the database"
}

variable "database_password" {
  type = string
  default = "wknduenfew33k#2"
  description = "Password for database"
}

variable "db_cluster_parameter_group_family" {
  type = string
  default = "aurora-postgresql14"
  description = "Database cluster group"
}
