terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "roche-diait"

    workspaces {
      name = "testing-terraform"
    }
  }
}

terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.26.1"
    }
  }
}

credentials "app.terraform.io" {
  token = "xUTjKrE7uXJ-zhnvm-Zm"
}

provider "tfe" {
  token    = var.tfe_token
}

resource "tfe_team" "test" {
  name         = "my-team-team-pradeep"
  organization = "roche-diait"
}

resource "tfe_workspace" "test" {
  name         = "my-test-workspace-name"
  organization = "roche-diait"
  tag_names    = ["test", "app"]
}
