# Create groups
group "kollokusers" do
  gid "2000"
  action :create
end

group "kolloksudoers" do
  gid "2001"
  action :create
end

# Create users
user "dante" do
  uid "2000"
  gid "kollokusers"
  home "/home/dante"
  shell "/bin/bash"
  supports :manage_home => true
  action :create 
end

# Make the kolloks sudoers
group "kolloksudoers" do
  members ['dante']
  action :modify
end
