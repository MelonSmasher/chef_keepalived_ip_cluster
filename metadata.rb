name 'keepalived_ip_clusters'
maintainer 'Alex Markessinis'
maintainer_email 'markea125@gmail.com'
license 'MIT'
description 'Configures a Keepalived cluster with shared virtual IP addresses.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.3'
%w( centos debian redhat ubuntu ).each do |os|
  supports os
end
depends 'keepalived', '~> 3.0.2'
issues_url 'https://github.com/MelonSmasher/chef_keepalived_ip_cluster/issues' if respond_to?(:issues_url)
source_url 'https://github.com/MelonSmasher/chef_keepalived_ip_cluster' if respond_to?(:source_url)
