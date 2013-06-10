case node['platform_family']
when "debian"
  include_recipe "apt"
  include_recipe "unattended-upgrades"
when "rhel"
  include_recipe "yum::epel"
end
