resource "aws_instance" "ec2-one" {
  ami = "ami-01eccbf80522b562b"
  vpc_security_group_ids = [aws_security_group.ec2.id]
  subnet_id = aws_subnet.private_subnet1.id
  user_data = file("userdata.sh")
#  key_name = ""
  instance_type = "t2.micro"
  tags={
    Name = "webserver-1"
  }
}

# Generates a secure private k ey and encodes it as PEM
resource "tls_private_key" "ec2_key1" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
# Create the Key Pair
resource "aws_key_pair" "ec2_key1" {
  key_name   = "privatekeypair1"  
  public_key = tls_private_key.ec2_key1.public_key_openssh
}
# Save file
resource "local_file" "ssh_key1" {
  filename = "keypair.pem"
  content  = tls_private_key.ec2_key1.private_key_pem
}

resource "aws_instance" "ec2-two" {
  ami = "ami-01eccbf80522b562b"
  vpc_security_group_ids = [aws_security_group.ec2.id]
  subnet_id = aws_subnet.private_subnet2.id
  user_data = file("userdata.sh")
#  key_name = ""
  instance_type = "t2.micro"
  tags={
    Name = "webserver-2"
  }
}

  
# Generates a secure private k ey and encodes it as PEM
resource "tls_private_key" "ec2_key2" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
# Create the Key Pair
resource "aws_key_pair" "ec2_key2" {
  key_name   = "privatekeypair2"  
  public_key = tls_private_key.ec2_key2.public_key_openssh
}
# Save file
resource "local_file" "ssh_key2" {
  filename = "keypair.pem"
  content  = tls_private_key.ec2_key2.private_key_pem
}
