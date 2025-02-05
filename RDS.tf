resource "aws_db_instance" "myrds" {
   allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0.34"
  instance_class       = "db.t3.micro" # Updated instance class
  username             = "admin"
  password             = "adminpassword"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  publicly_accessible  = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

   tags = {
     Name = "MyRDS"
   }
 }
