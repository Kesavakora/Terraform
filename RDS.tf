resource "aws_db_instance" "myrds" {
   allocated_storage   = 20
   storage_type        = "gp2"
   identifier          = "mydb"
   engine              = "mysql"
   engine_version      = "8.0.34"
   instance_class      = "db.t2.micro"
   username            = "admin"
   password            = "Passw0rd!123"
   publicly_accessible = true
   skip_final_snapshot = true
   parameter_group_name = "default.mysql8.0"        # Parameter group for MySQL 8.0
   skip_final_snapshot  = true                      # Avoid final snapshot on deletion
   publicly_accessible  = true                      # Set to false for private access
   vpc_security_group_ids = [aws_security_group.allow_ssh.name]


   tags = {
     Name = "MyRDS"
   }
 }