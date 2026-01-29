
module "frontend" {
  source      = "../../modules/s3_cloudfront"
  bucket_name = "mern-ui-test"
  domain_name = "app-test.example.com"
}
