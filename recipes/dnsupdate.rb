require 'net/http'
include_recipe 'route53'

# uses the permissions on the IAM role assigned to the machine

dns = node[:awsutil][:dnsupdate]

route53_record "create A record" do
  name  node[:opsworks][:instance][:hostname] + dns[:domain]
  value node[:opsworks][:instance][:private_ip] 
  type  "A"
  ttl   60
  zone_id              dns[:zoneid] #  node[:dns_zone_id]
  #aws_access_key_id     node[:custom_access_key]
  #aws_secret_access_key node[:custom_secret_key]
  overwrite true
  action :create
end
