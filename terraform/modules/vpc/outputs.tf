output "vpc_id" {
  value = aws_vpc.testvpc.id
}

output "subnet1" {
  value = aws_subnet.testsubnet1.id
}

output "subnet2" {
  value = aws_subnet.testsubnet2.id
}

