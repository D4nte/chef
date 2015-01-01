
# Create groups
group "kollokusers" do
  gid "2000"
  action :create
end

group "kolloksudoers" do
  gid "2001"
  action :create
end


node[:users].each do |user|
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

cookbook_file userhome + "/.ssh/authorized_keys" do
  source username + "/ssh.pub"
  mode 0600
  owner username
  group "kollokusers"
  ignore_failure true
end
end
