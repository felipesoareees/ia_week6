# If you use a instance.tf file, uncomment this lines.
#output "public_ip" {
#  value       = aws_instance.test.public_ip
#  description = "The public IP to access of the web server"
#}

output "alb_dns_name" {
 value       = aws_lb.test.dns_name
 description = "The domain name of the load balancer"
}
