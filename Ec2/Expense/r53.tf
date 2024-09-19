resource "aws_route53_record" "expense" {
    count = length(var.instance_names)
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instances.expense[count.index].private_ip]
}