## Used for testing only

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
