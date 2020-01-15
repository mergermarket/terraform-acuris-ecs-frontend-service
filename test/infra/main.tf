terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version                     = ">= 2.15"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_get_ec2_platforms      = true
  skip_region_validation      = true
  skip_requesting_account_id  = true
  max_retries                 = 1
  access_key                  = "a"
  secret_key                  = "a"
  region                      = "eu-west-1"
}

module "service" {
  source = "../.."

  env                        = "ci"
  cpu                        = "256"
  memory                     = "512"
  port                       = "1234"
  alb_listener_arn           = "arn:aws:elasticloadbalancing:eu-west-1:123456789012:listener/app/frontend-route/ae493096782583e1/01817b5287e35d21"
  alb_listener_rule_priority = "1"

  release = {
    "component" : "ecs-frontend-service-test",
    "version" : "1",
    "image_id" : "imageId",
    "team" : "super-team"
  }
  platform_config = {
    "vpc" : "vpcId"
  }
  is_test = true
}

module "service_with_name_suffix" {
  source = "../.."

  env                        = "ci"
  cpu                        = "256"
  memory                     = "512"
  port                       = "1234"
  alb_listener_arn           = "arn:aws:elasticloadbalancing:eu-west-1:123456789012:listener/app/frontend-route/ae493096782583e1/01817b5287e35d21"
  alb_listener_rule_priority = "1"

  release = {
    "component" : "ecs-frontend-service-test",
    "version" : "1",
    "image_id" : "imageId",
    "team" : "super-team"
  }
  platform_config = {
    "vpc" : "vpcId"
  }
  is_test     = true
  name_suffix = "-new"
}
