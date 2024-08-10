resource "null_resource" "linux_provisioner" {
  for_each = azurerm_linux_virtual_machine.linux_vm

  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "remote-exec" {
    inline = ["/usr/bin/hostname"]
    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file(var.private_key_path)
      host        = azurerm_public_ip.linux_pip[each.key].ip_address
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${azurerm_public_ip.linux_pip[each.key].ip_address},' -u ${var.admin_username} --private-key ${var.private_key_path} /home/n01657087/automation/ansible/n01657087-playbook.yml"
  }

  depends_on = [azurerm_linux_virtual_machine.linux_vm]
}
