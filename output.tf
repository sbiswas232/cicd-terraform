output "available_zones" {
  value = data.aws_availability_zones.available_zone.names
}
