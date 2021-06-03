provider "metal" {
  auth_token = "${var.auth_token}"
}
//Metal Project
data "metal_project" "project" {
  name = "PROJECT"
}
//Get the device id of the Pure FA Controller 0
data "metal_device" "PureCT0" {
  project_id = data.metal_project.project.project_id
  hostname   = "PureCT0"
}

//Get the device id of the Pure FA Controller 1
data "metal_device" "PureCT1" {
  project_id = data.metal_project.project.project_id
  hostname   = "PureCT1"
}