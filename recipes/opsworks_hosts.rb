# aws-util::opsworks_hosts
# extracts the opsworks layer ip and hosts into an aws agnostic structure

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

