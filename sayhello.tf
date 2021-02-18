resource "aws_lambda_function" "sayhello" {
  function_name = "sayhello"

  # The bucket name as created earlier with "aws s3api create-bucket"
  s3_bucket = "${var.s3_bucket}"
  s3_key    = "sayhello.zip"

  handler     = "lambda_function.lambda_handler"
  runtime     = "python3.8"
  memory_size = 256
  timeout     = 10

  role = "${aws_iam_role.sayhellorole.arn}"
}

