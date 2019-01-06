data "aws_route53_zone" "terraform-blue-green" {
  name = "devops4you.tk"
}

resource "aws_route53_record" "terraform-blue-green" {
  zone_id = "${data.aws_route53_zone.terraform-blue-green.zone_id}"
  name    = "www.devops4you.tk"
  type    = "A"

  alias {
    name                   = "dualstack.${aws_elb.terraform-blue-green.dns_name}"
    zone_id                = "${aws_elb.terraform-blue-green.zone_id}"
    evaluate_target_health = false
  }
}