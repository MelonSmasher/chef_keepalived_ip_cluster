#
# Cookbook:: keepalived_reverse_proxy
# Recipe:: default
#

include_recipe 'keepalived'

clusters = node['keepalived']['clusters']

instance = 0

if !clusters.empty?
  clusters.each do |cluster|

    password = cluster['password']
    members = cluster['members']
    addresses = cluster['addresses']

    if !password.nil?
      if !members.nil?
        members.each do |member, details|
          if member == node['hostname']
            keepalived_vrrp_instance "ip_config_#{instance.to_s}" do
              state details['state']
              interface node['network']['default_interface']
              virtual_router_id (instance+1)
              priority details['priority']
              authentication auth_type: 'PASS', auth_pass: password
              virtual_ipaddress addresses
              advert_int 1
              notifies :restart, 'service[keepalived]', :delayed
            end
          end
        end
      else
        log 'Keepalive Cluster: No Members' do
          message "There are no members defined for virtual ip: #{address}, moving on..."
          level :warn
        end
      end
    else
      log 'Keepalive Cluster: Missing Password' do
        message "There is no password defined for this cluster, moving on..."
        level :warn
      end
    end
    instance = instance + 1
  end

else
  log 'Keepalive Cluster: No Clusters' do
    message "There are no clusters defined moving on..."
    level :warn
  end
end