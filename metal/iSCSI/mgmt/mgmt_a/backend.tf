terraform {
  backend "remote" {
    organization = "ORG_NAME"

    workspaces {
      name = "WORKSPACE_NAME"
    }
  }
}