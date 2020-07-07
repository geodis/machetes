# SImplemente un EJEMPLO porque no tengo dominio

# Zona
resource "aws_route53_zone" "newtech-academy" {
  name = "newtech.academy"
}
# record
resource "aws_route53_record" "server1-record" {
  zone_id = aws_route53_zone.newtech-academy.id
  name = "server1.newtech.academy"
  type = "A"
  ttl = "300"
  records = [1.2.3.4]
}

# record
resource "aws_route53_record" "www-record" {
  zone_id = aws_route53_zone.newtech-academy.id
  name = "www.newtech.academy"
  type = "A"
  ttl = "300"
  records = [2.3.4.5]
}
# MX
resource "aws_route53_record" "mail1-record" {
  zone_id = aws_route53_zone.newtech-academy.id
  name = "newtech.academy"
  type = "MX"
  ttl = 300
  records = [
    "1 aspmx.l.google.com.",
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "10 aspmx2.googlemail.com.",
    "10 aspmx3.googlemail.com.",
  ]
}

output "ns-servers" {
  value = aws_route53_zone.newtech-academy.name_servers
}




















