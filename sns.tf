# SNS Topic for Notifications
resource "aws_sns_topic" "alarm_notifications" {
  name = "lambda-function-alarm-topic"
}

# Email Subscription
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alarm_notifications.arn
  protocol  = "email"
  endpoint  = "Nikhil.Vallapureddy@regions.com"
}

# Teams Webhook Subscription
resource "aws_sns_topic_subscription" "teams_subscription" {
  topic_arn = aws_sns_topic.alarm_notifications.arn
  protocol  = "https"
  endpoint  = "https://regions.webhook.office.com/webhookb2/1d64cc35-7517-439a-a3dd-7dea0c13c738@5106ea48-5455-4f16-9fdc-caa5bfaf19dd/IncomingWebhook/c86406205781427a9873462b1f153eff/663f6eb0-ff6b-47b0-b221-0479e7790244/V2LjM2aZwvShXwxsPkdhX7eM2cz3yJ2P833T7Ya9psnNc1"
}

resource "aws_sns_topic_subscription" "sns_to_lambda" {
  topic_arn = aws_sns_topic.alarm_notifications.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.backend_lambda.arn
}

# Grant SNS Permission to Invoke Lambda
resource "aws_lambda_permission" "sns_invoke" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.backend_lambda.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.alarm_notifications.arn
}
