################################################################
# locals
#################################################################
locals {
  environment     = "dev"
  domain_name     = "wmtm-api.wmtm.rgnscloud-dev.com"
  kms_arn         = data.aws_kms_alias.encryption_alias.arn
  account_id      = data.aws_caller_identity.current.account_id
  tags            = {}
  vpc_id          = var.vpc_tag
  subnet_ids      = ["subnet-0cf9fe6041c638dc9","subnet-0288deb7f1e0c4fd0","subnet-0e31c7916c4bd6eca"]
  cidr_blocks     = ["10.246.120.64/26","10.246.120.128/26","10.246.120.192/26"]

  lambda_variables = {
    APPLICATION_CODE                   = var.application_code
    ACCOUNT_ID                         = var.aws_account_number
    ASPNETCORE_ENVIRONMENT             = var.ASPNETCORE_ENVIRONMENT
    REGION                             = var.aws_region
    SERVICE_NAME                       = var.service_name
    ENVIRONMENT_NAME                   = var.environment
    LOG_LEVEL                          = var.log_level
    RELEASE_VERSION                    = var.release_version
    AWS_LAMBDA_EXEC_WRAPPER            = var.seeker_enabled ? "/opt/seeker-handler" : ""
    SEEKER_ENABLED                     = var.seeker_enabled
    SEEKER_SERVER_URL                  = var.seeker_server_url
    SEEKER_PROJECT_KEY                 = var.service_name
    SEEKER_COMPOSITE_PROJECT_KEY       = var.seeker_composite_project_key
    SEEKER_AGENT_LOG_LEVEL             = "INFO"
    #DB_HOSTNAME                        = data.aws_rds_cluster.db_cluster.endpoint
    #DB_PORT                            = data.aws_rds_cluster.db_cluster.port
    DB_USER                            = var.db_user
    #DB_DATABASE                        = data.aws_rds_cluster.db_cluster.database_name
    DB_SCHEMA                          = var.db_schema
    HOME                               = "/tmp"
    POWERTOOLS_TRACER_CAPTURE_RESPONSE = false
    NODE_EXTRA_CA_CERTS          = "/opt/nodejs/ca-certs/bundle.pem"
    OKTA_ISSUER                  = var.okta_issuer
    OKTA_ISSUER_INTERNAL         = var.okta_issuer_internal
    OKTA_AUDIENCE                = var.okta_audience
    OKTA_AUDIENCE_INTERNAL       = var.okta_audience_internal
    SSE_KMS_KEY_ALIAS            = var.kms_key_alias
    VAULT_ADDR                   = var.vault_address
    VAULT_AUTH_PROVIDER          = var.vault_auth_provider
    VAULT_AUTH_ROLE              = var.vault_auth_role
    VAULT_NAMESPACE              = var.vault_namespace
    END_BASE_URL                 = var.enterprise_notification_delivery_proxy_base_url
    VOLTAGE_ENABLED              = var.voltage_enabled
    ACCESS_VOLTAGE_FN_NAME       = "${var.sdlc_environment}-accessVoltageEventHandler-${data.aws_region.current.name}"
    PROTECT_VOLTAGE_FN_NAME      = "${var.sdlc_environment}-protectVoltageEventHandler-${data.aws_region.current.name}"
    OKTA_INTERNAL_URL            = var.okta_internal_url
    OKTA_GRANT_TYPE              = var.okta_granttype
    OKTA_SCOPE                   = var.okta_scope
  }
}
