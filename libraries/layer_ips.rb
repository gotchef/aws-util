module AwsUtil
	def layer_ips (layer)
		hosts = []
		return hosts if layer.nil? or layer.empty?
		
		instances = node[:opsworks][:layers][layer][:instances]
		instances.each do |name, instance| 
			hosts.push("#{instance[:private_ip]}")
		end
		return hosts
	end
	def layers_ips (layers = [])
		hash = {}
		return hash if layers.nil? or layers.empty? 

		layers.each { |layer|
			hash[layer] = layer_ips layer
		}
	end 
end

