# Backend Lambda function with token verification logic
resource "aws_lambda_function" "backend_lambda" {
  function_name = var.function_name_backend_lambda 
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
  filename      = "lambda.zip"
  source_code_hash = filebase64sha256("lambda.zip")

  environment {
    variables = local.lambda_variables
  }
}

###############################################################################
# Lambda Networking
###############################################################################

resource "aws_security_group" "lambda" {
  name        = var.wmtm_lambda_sg_group_name
  vpc_id      = local.vpc_id
  description = "Allows lambda to reach other hosts via TCP."
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.lambda.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
