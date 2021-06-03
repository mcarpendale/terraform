output "CT0_iSCSI_A_Attachments" {
  value = {for k, v in metal_port_vlan_attachment.PureCT0iSCSIa: "PureCT0iSCSIa[${k}]" => {"VLAN" = v.vlan_vnid, "VLAN UUID" = v.vlan_id}}
}
output "CT1_iSCSI_A_Attachments" {
  value = {for k, v in metal_port_vlan_attachment.PureCT1iSCSIa: "PureCT1iSCSIa[${k}]" => {"VLAN" = v.vlan_vnid, "VLAN UUID" = v.vlan_id}}
}