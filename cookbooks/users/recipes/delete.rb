## Used for testing only

username = "dante"
userhome = "/home/" + username 

# delete ssh pub keys
file userhome + "/.ssh/authorized_keys" do
  action :delete
end

directory userhome + "/.ssh" do
  action :delete
end

# delete users
user "dante" do
  supports :manage_home => true
  action :remove 
end

# delete groups
group "kollokusers" do
  action :remove
end

group "kolloksudoers" do
  action :remove
end
