##################### Main Dev Values #######################################
application_code          = "WMTM"
environment               = "dev"
artifact_name             = "<+execution.steps.Retrieve_Source_Artifact.output.outputVariables.lambdazipfile>"
artifactory_url           = "https://alm.rgbk.com/artifactory/"
artifactory_token         = "<+secrets.getValue("account.svcAlmProdTerraformAccessToken")>"
aws_account_number        = "867344475630"
aws_region                = "us-east-1"
tf_workspace              = "Regions-Bank/wmtm-aws-nonprod"
vault_role_id             = "" # Leave blank, will be set in TFE SECRETS
vault_secret_id           = "" # Leave blank, will be set in TFE SECRETS
vault_backend             = "aws_wmtm_dev-credproducer-path"
vault_approle             = "aws_wmtm_dev-role"
vault_namespace           = "wmtm"
vault_auth_path           = "auth/wmtm_prod_approle/login"
vault_address             = "https://vault.rgnscloud.com:8200"
kms_key_alias             = "alias/project_wmtm_services"
kms_key_id                = "3d9cb777-7733-4e98-9646-c0e434c60973"
log_alerts_enabled        = false
log_level                 = "DEBUG"
debug_level               = "*"

############################################
##### Lambda ################################
######################################
wmtm_api_lambda_name         = "wmtm-api-lambda-msteams"
wmtm_api_lambda_migrator_name = "wmtm-api-lambda-migrator"
lambda_runtime_version       = "python3.9"
lambda_memory_size           = 128
timeout                      = 300
api_handler                  = "wmtm.api"
wmtm_lambda_sg_group_name    = "wmtm_sg_msteams"
s3_bucket_name               = "wmtm-api-lambda-s3-bucket"
wmtm_lambda_s3_keyname       = "<+execution.steps.Retrieve_Source_Artifact.output.outputVariables.lambdazipfile>"
wmtm_lambda_s3_ziphash       = "<+execution.steps.Retrieve_Source_Artifact.output.outputVariables.lambdazip_sha256>"
okta_audience                = "https://regionscommercialfedtest.regionstest.com"
okta_audience_internal       = "api://wmtm"
okta_issuer                  = "https://regionscommercialfedtest.regionstest.com/oauth2/aus66uwn10xKW38t41d7"
okta_issuer_internal         = "https://regions-internal-qa.oktapreview.com/oauth2/aus9cko5g9UIkRgRJ1d7"
voltage_enabled              = "false" //this bool value should be string.
db_cluster_identifier        = "dev-wmtm-database-db"
db_security_group_name       = "dev-wmtm-database-db"
seeker_enabled               = false
ASPNETCORE_ENVIRONMENT       = "Development"
#################################################
######## API gateway##########################
#################################################
api_name                    = "wmtm-api"
api_gateway_name            = "wmtm-api-gateway"
log_retention               = 14
custom_domain_enabled       = false
api_acl_name                = "aws-waf-wmtm_regional_us-east-1_dev_internal_webacl"
custom_domain_hosted_zone   = "wmtm-api.wmtm.rgnscloud-dev.com"
custom_domain_name          = "api-us-east-1-dev.wmtm-api.wmtm.rgnscloud-dev.com"
acm_certificate_name        = "*.wmtm-api.wmtm.rgnscloud-dev.com"

lambda_functions = ["dev-a_us-east-1_wmtm-api_Plan", "dev-b_us-east-1_wmtm-api_Plan", "wm-database-dev_migrator", "dev-voltage-protect", "dev-voltage-access"]
