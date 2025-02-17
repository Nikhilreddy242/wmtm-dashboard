resource "aws_cloudwatch_metric_alarm" "lambda_alarms" {
  for_each = { for lambda_function in var.lambda_functions : lambda_function => lambda_function }

  alarm_name          = "${each.value}-alarm"
  namespace           = "AWS/Lambda"
  statistic           = var.lambda_metrics[0].statistic
  period              = var.lambda_metrics[0].period
  evaluation_periods  = var.lambda_metrics[0].evaluation_periods
  threshold           = var.lambda_metrics[0].threshold
  comparison_operator = var.lambda_metrics[0].comparison_operator
  alarm_actions       = var.alarm_actions

  dimensions = {
    FunctionName = each.value
  }
}
