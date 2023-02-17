resource "aws_eip" "eip" {
  vpc      = true
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = var.subnet_id

  tags = var.tags

}

