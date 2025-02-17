# Create CloudWatch Dashboard
resource "aws_cloudwatch_dashboard" "lambda_dashboard" {
  dashboard_name = "LambdaMonitoringDashboard"

  dashboard_body = jsonencode({
    widgets = concat(
      [for index, function in var.lambda_functions : {
        "type" : "metric",
        "x" : 6 * (index % 2),  # Arrange widgets in two columns
        "y" : floor(index / 2) * 6, # Move down every two widgets
        "width" : 6,
        "height" : 6,
        "properties" : {
          "metrics" : [
            ["AWS/Lambda", "Invocations", "FunctionName", function],
            ["AWS/Lambda", "Errors", "FunctionName", function],
            ["AWS/Lambda", "Duration", "FunctionName", function],
            ["AWS/Lambda", "Throttles", "FunctionName", function]
          ],
          "view" : "timeSeries",
          "stacked" : false,
          "region" : "us-east-1",
          "title" : "Metrics for ${function}"
        }
      }]
    )
  })
}



# Define colors for each metric
locals {
  metric_colors = {
    "5XXError"          = "#d62728"  # Red for critical server errors
    "4XXError"          = "#ff7f0e"  # Orange for client errors
    "Latency"           = "#9467bd"  # Purple for latency
    "IntegrationLatency"= "#1f77b4"  # Blue for integration latency
    "CacheMissCount"    = "#bcbd22"  # Yellow-green for cache misses
    "default"           = "#2ca02c"  # Green for normal metrics
  }
}


# Define threshold values for each metric
variable "api_gateway_thresholds" {
  type = map(number)
  default = {
    Count               = 1000,  # High request volume threshold
    "4XXError"          = 50,    # Too many client errors
    "5XXError"          = 10,    # Too many server errors
    Latency             = 300,   # Latency in ms
    IntegrationLatency  = 200,   # Integration latency in ms
    CacheHitCount       = 500,   # Cache hit threshold
    CacheMissCount      = 50     # Cache miss threshold
  }
}


# Create CloudWatch Dashboard
resource "aws_cloudwatch_dashboard" "api_gateway_dashboard" {
  dashboard_name = "APIGatewayMonitoringDashboard"

  dashboard_body = jsonencode({
    widgets = concat(
      [for index, api in var.api_gateway_ids : {
        "type" : "metric",
        "x" : 6 * (index % 2),  # Arrange widgets in two columns
        "y" : floor(index / 2) * 6, # Move down every two widgets
        "width" : 6,
        "height" : 6,
        "properties" : {
          "metrics" : [
            ["AWS/ApiGateway", "Count", "ApiName", api, "Stage", "default"],
            ["AWS/ApiGateway", "4XXError", "ApiName", api, "Stage", "default"],
            ["AWS/ApiGateway", "5XXError", "ApiName", api, "Stage", "default"],
            ["AWS/ApiGateway", "Latency", "ApiName", api, "Stage", "default"],
            ["AWS/ApiGateway", "IntegrationLatency", "ApiName", api, "Stage", "default"],
            ["AWS/ApiGateway", "CacheHitCount", "ApiName", api, "Stage", "default"],
            ["AWS/ApiGateway", "CacheMissCount", "ApiName", api, "Stage", "default"]
          ],
          "view" : "timeSeries",
          "stacked" : false,
          "region" : "us-east-1",
          "title" : "Metrics for API Gateway: ${api}",  
          
          # Add thresholds for all metrics
          "annotations": {
            "horizontal": [
              for metric_name, threshold in var.api_gateway_thresholds : {
                "label" : "${metric_name} Threshold",
                "value" : threshold,
                "color" : lookup(local.metric_colors, metric_name, local.metric_colors["default"]),
                "fill"  : "above"
              }
            ]
          }
        }
      }]
    )
  })
}
