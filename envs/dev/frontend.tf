
module "frontend" {
  source      = "../../modules/s3_cloudfront"
  bucket_name = "mern-ui-dev"
  domain_name = "app-dev.example.com"
}
