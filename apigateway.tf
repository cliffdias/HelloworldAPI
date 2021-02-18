resource "aws_api_gateway_rest_api" "sayhello-api-gateway" {
  name           = "SayHelloAPI"
  description    = "Demo API to Say Hello"
  api_key_source = "HEADER"
  body           = "${data.template_file.helloworld.rendered}"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

data "template_file" "helloworld" {
  template = "${file("helloworld.yaml")}"


  vars = {
    get_lambda_arn          = "${aws_lambda_function.sayhello.arn}"
    aws_region              = var.AWS_REGION
    lambda_identity_timeout = var.lambda_identity_timeout
  }

}

resource "aws_api_gateway_stage" "sayhellostage" {
  deployment_id = aws_api_gateway_deployment.sayhellodeployment.id
  rest_api_id   = aws_api_gateway_rest_api.sayhello-api-gateway.id
  stage_name    = "stage1"
}

resource "aws_api_gateway_deployment" "sayhellodeployment" {
  rest_api_id = aws_api_gateway_rest_api.sayhello-api-gateway.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.sayhello-api-gateway.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}



output "url" {
  value = "${aws_api_gateway_deployment.sayhellodeployment.invoke_url}/"
}
