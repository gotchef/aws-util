
include_recipe "aws"

tags = node['aws-util'][:tags]
unless tags.nil? || tags.empty? 
    aws_resource_tag node[:ec2][:instance_id] do
        tags(tags)
        action :update
    end
end
