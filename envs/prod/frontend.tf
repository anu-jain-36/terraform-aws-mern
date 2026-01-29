
module "frontend" {
  source      = "../../modules/s3_cloudfront"
  bucket_name = "mern-ui-prod"
  domain_name = "app-prod.example.com"
}
