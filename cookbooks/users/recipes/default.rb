
# Create groups
group "kollokusers" do
  gid "2000"
  action :create
end

group "kolloksudoers" do
  gid "2001"
  action :create
end


node[:kollokusers].each do |user|
username = user[:username]
uid = user[:uid]
userhome = "/home/" + username 

# Create users
user username do
  uid uid
  gid "kollokusers"
  home userhome
  shell "/bin/bash"
  supports :manage_home => true
  action :create 
end

# Make the kolloks sudoers
group "kolloksudoers" do
  members [ username ]
  action :modify
end

# Add the ssh pub keys
directory userhome + "/.ssh" do
  owner username
  group 'kollokusers'
  mode '0700'
  action :create
end

sshpub = username + "/ssh.pub"
cookbook_file userhome + "/.ssh/authorized_keys" do
  only_if { run_context.has_cookbook_file_in_cookbook?(cookbook_name, sshpub) }
  source sshpub
  mode 0600
  owner username
  group "kollokusers"
  ignore_failure true
end

begin
include_recipe "users::" + username 
rescue Chef::Exceptions::RecipeNotFound
end

end
