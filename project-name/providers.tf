provider "aws" {
  region  = var.region
  profile = var.profile

  default_tags {
    tags = {
      Automation   = "terraform"
      project-name = "rentzone"
      env_code     = "dev"
    }
  }
}
