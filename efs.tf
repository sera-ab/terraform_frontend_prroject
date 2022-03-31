resource "aws_efs_file_system" "frontend_efs" {
  performance_mode = var.performance_mode
  encrypted        = var.encrypted
  tags = {
    Name = "MyEFS"
  }

  # tags = var.tags_map
}

resource "aws_efs_mount_target" "frontend_efs" {
  file_system_id = aws_efs_file_system.frontend_efs.id
  #count          = length(var.efs_subnet_id)
  subnet_id      = var.subnet_id
  security_groups = var.security_group
}
