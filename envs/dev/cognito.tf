
module "cognito" {
  source = "../../modules/cognito"

  user_pool_name = "mern-dev"
  callback_urls = [
    "https://dxxxxxxxx.cloudfront.net/callback"
  ]
  logout_urls = [
    "https://dxxxxxxxx.cloudfront.net"
  ]
}
