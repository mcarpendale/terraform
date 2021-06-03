output "CT0_iSCSI_B_Attachments" {
  value = {for k, v in metal_port_vlan_attachment.PureCT0iSCSIb: "PureCT0iSCSIb[${k}]" => {"VLAN" = v.vlan_vnid, "VLAN UUID" = v.vlan_id}}
}

output "CT1_iSCSI_B_Attachments" {
  value = {for k, v in metal_port_vlan_attachment.PureCT1iSCSIb: "PureCT1iSCSIb[${k}]" => {"VLAN" = v.vlan_vnid, "VLAN UUID" = v.vlan_id}}
}