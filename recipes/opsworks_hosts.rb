# aws-util::opsworks_hosts
# extracts the opsworks layer ip and hosts into an aws agnostic structure
if node[:opsworks].nil? 
	Chef::Log.info('not running inside opsworks, can not pick up opsworks hosts')	
else
	layers = node[:opsworks][:layers]
	layers.each do | layername, layer|
		instances = layer[:instances]
		ips = []
		hosts = []
		instances.each do |hostname, instance| 
			hosts.push(hostname)
			ips.push(instance[:private_ip])
		end
	
		node.default[:stack][layername][:ips] = ips
		node.default[:stack][layername][:hosts] = hosts
	end
	
	node.default[:me][layers] = node[:opsworks][:instance][:layers].map(&:downcase)
end
