resource "aws_db_instance" "mariadb" {
  allocated_storage = 100
  storage_type = "gp2"
  engine = "mariadb"
  instance_class = "db.t2.micro"
  name = "mariadb-db"
  username = "root"
  password = "qwerty"
  db_subnet_group_name = aws_db_subnet_group.mariadb-subnet.name
  parameter_group_name = aws_db_parameter_group.mariadb-parameters.name
  multi_az = false
  vpc_security_group_ids = [aws_security_group.allow-mariadb.id]
  availability_zone = aws_subnet.main-private-1.availability_zone
  skip_final_snapshot = true
  tags = {
    Name = "mariadb-instance"
  }

}

resource "aws_db_subnet_group" "mariadb-subnet" {
  name = "mariadb-subnet"
  subnet_ids = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id]
}

resource "aws_db_parameter_group" "mariadb-parameters" {
  family = "mariadb10.1"
  name = "mariadb-parameters"
  parameter {
    name = "max_allowed_packet"
    value = "16777216"
  }
}