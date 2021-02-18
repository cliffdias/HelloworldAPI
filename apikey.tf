resource "aws_api_gateway_api_key" "sayhello" {
  name = "sayhellokey"
}

resource "aws_api_gateway_usage_plan_key" "devUsageKey" {
  key_id        = aws_api_gateway_api_key.sayhello.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.DevUsagePlan.id
}

resource "aws_api_gateway_usage_plan" "DevUsagePlan" {
  name         = "dev-usage-plan"
  description  = "dev usage plan for say hello"
  product_code = "sayhello"

  api_stages {
    api_id = aws_api_gateway_rest_api.sayhello-api-gateway.id
    stage  = aws_api_gateway_stage.sayhellostage.stage_name
  }

  quota_settings {
    limit  = 1000
    offset = 0
    period = "DAY"
  }

  throttle_settings {
    burst_limit = 20
    rate_limit  = 100
  }
}
