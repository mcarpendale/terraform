terraform {
  backend "remote" {
    organization = "Pure-Storage"

    workspaces {
      name = "WORKSPACE_NAME"
    }
  }
}