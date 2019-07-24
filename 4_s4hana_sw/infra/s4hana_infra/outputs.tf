output "hdb_vm_user" {
  value = "${var.vm_user}"
}

output "hdb_ip" {
  value = "${module.create_hdb.fqdn}"
}