//Create Customer iSCSI A VLANs. 
//Number of Customers to be created is equal to device_count
//iSCSI A starts at 2000 with increment of 2s, i.e. 2000, 2002, 2004........
resource "metal_vlan" "iSCSIa" {
  count       = var.device_count
  description = "SY_Cust_${format("0%03d" ,count.index+1)}_iSCSIa"
  metro       = var.location
  #facility     = "da11"
  project_id  = data.metal_project.project.id
  vxlan       = "${format("2%03d", count.index * 2)}"
}
//Add iSCSI A VLANs created above to eth4 of Pure FA Controller 0 (PureCT0-eth4)
//this loops based on device_count
resource "metal_port_vlan_attachment" "PureCT0iSCSIa" {
  count     = var.device_count
  device_id = data.metal_device.PureCT0.id
  port_name = "eth4"
  vlan_vnid = metal_vlan.iSCSIa[count.index].vxlan
}
//Add iSCSI A VLANs created above to eth4 of PPure FA Controller 1 (PureCT1-eth4)
//this loops based on device_count
resource "metal_port_vlan_attachment" "PureCT1iSCSIa" {
  count     = var.device_count
  device_id = data.metal_device.PureCT1.id
  port_name = "eth4"
  vlan_vnid = metal_vlan.iSCSIa[count.index].vxlan
}