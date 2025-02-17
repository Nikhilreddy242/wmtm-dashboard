resource "aws_cloudwatch_metric_alarm" "api_gateway_alarms" {
  for_each = { for api in var.api_gateway_ids : api => api }

  alarm_name          = "${each.value}-alarm"
  namespace           = "AWS/ApiGateway"
  statistic           = var.api_gateway_metrics[0].statistic
  period              = var.api_gateway_metrics[0].period
  evaluation_periods  = var.api_gateway_metrics[0].evaluation_periods
  threshold           = var.api_gateway_metrics[0].threshold
  comparison_operator = var.api_gateway_metrics[0].comparison_operator
  alarm_actions       = var.alarm_actions

  dimensions = {
    ApiName = each.value
  }
}
