//Create Customer iSCSI B VLANs. 
//Number of Customers to be created is equal to device_count
//iSCSI B starts at 2001 with increment of 2s, i.e. 2001, 2003, 2005........
resource "metal_vlan" "iSCSIb" {
  count       = var.device_count
  description = "SY_Cust_${format("0%03d", count.index + 1)}_iSCSIb"
  metro       = var.location
  #facility     = "da11"
  project_id = data.metal_project.project.id
  vxlan      = format("2%03d", count.index * 2 + 1)
}
//Add iSCSI B VLANs created above to eth5 of Pure FA Controller 0 (PureCT0-eth5)
//this loops based on device_count
resource "metal_port_vlan_attachment" "PureCT0iSCSIb" {
  count     = var.device_count
  device_id = data.metal_device.PureCT0.id
  port_name = "eth5"
  vlan_vnid = metal_vlan.iSCSIb[count.index].vxlan
}
//Add iSCSI B VLANs created above to eth5 of Pure FA Controller 1 (PureCT1-eth5)
//this loops based on device_count
resource "metal_port_vlan_attachment" "PureCT1iSCSIb" {
  count     = var.device_count
  device_id = data.metal_device.PureCT1.id
  port_name = "eth5"
  vlan_vnid = metal_vlan.iSCSIb[count.index].vxlan
}