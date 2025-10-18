terraform {
  required_providers { aws = { source = "hashicorp/aws", version = "~> 5.0" } }
}
provider "aws" { region = var.region }

resource "aws_dynamodb_table" "app" {
  name         = "${var.project}-${var.env}-app"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "pk"
  attribute { name = "pk"; type = "S" }
}

resource "aws_s3_bucket" "uploads" { bucket = "${var.project}-${var.env}-uploads" }
resource "aws_s3_bucket_server_side_encryption_configuration" "uploads" {
  bucket = aws_s3_bucket.uploads.id
  rule { apply_server_side_encryption_by_default { sse_algorithm = "AES256" } }
}
resource "aws_s3_bucket_public_access_block" "uploads" {
  bucket = aws_s3_bucket.uploads.id
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}

data "aws_iam_policy_document" "lambda_assume" {
  statement { actions = ["sts:AssumeRole"]
    principals { type = "Service" identifiers = ["lambda.amazonaws.com"] } }
}
resource "aws_iam_role" "lambda" {
  name               = "${var.project}-${var.env}-lambda"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume.json
}
resource "aws_iam_role_policy_attachment" "lambda_basic" {
  role       = aws_iam_role.lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "health" {
  function_name = "${var.project}-${var.env}-health"
  handler       = "health.handler"
  runtime       = "nodejs20.x"
  role          = aws_iam_role.lambda.arn
  filename      = "${path.module}/lambda_zips/health.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda_zips/health.zip")
  environment { variables = { ENV = var.env } }
}

resource "aws_apigatewayv2_api" "http" {
  name = "${var.project}-${var.env}-http"
  protocol_type = "HTTP"
}
resource "aws_apigatewayv2_integration" "health" {
  api_id           = aws_apigatewayv2_api.http.id
  integration_type = "AWS_PROXY"
  integration_uri  = aws_lambda_function.health.invoke_arn
  payload_format_version = "2.0"
}
resource "aws_apigatewayv2_route" "health" {
  api_id    = aws_apigatewayv2_api.http.id
  route_key = "GET /health"
  target    = "integrations/${aws_apigatewayv2_integration.health.id}"
}
resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowInvokeFromAPIG"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.health.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.http.execution_arn}/*/*"
}

resource "aws_cognito_user_pool" "pool" {
  name = "${var.project}-${var.env}-users"
  password_policy { minimum_length = 12 }
}

output "api_base_url" { value = aws_apigatewayv2_api.http.api_endpoint }
output "ddb_table"    { value = aws_dynamodb_table.app.name }
output "user_pool_id" { value = aws_cognito_user_pool.pool.id }
