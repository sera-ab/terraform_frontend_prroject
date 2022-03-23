resource "aws_instance" "frontend_web" {
  ami           = data.aws_ami.ami.id 
  key_name = var.key_name
  instance_type = var.instance_type
 # availability_zone = var.availability_zone
  subnet_id = var.subnet_id
  security_groups = var.security_group
  user_data = <<EOF
  # If we have a files EFS ID, mount it.
  # Otherwise, remove /files references from the nginx config.
  if [ "x${aws_efs_file_system.frontend_efs.id}" != "x" ]; then
  files_mnt='/files'
  echo "${aws_efs_file_system.frontend_efs.id}.efs.$AWS_REGION.amazonaws.com:/ $files_mnt nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2" >> /etc/fstab
  mkdir -p $files_mnt
  mount $files_mnt
  mkdir -p $files_mnt/scans
  else
  sed -i '/\/files\//d' $nginx_config_file
  fi
  EOF

  tags= {
    Name = "frontend_web"
    env = "dev"
    project = "frontend_web_project"
  }
