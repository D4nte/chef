group "kollokusers" do
  gid "2000"
  :create
end


user "dante" do
  uid "2000"
  gid "kollokusers"
  home "/home/dante"
  shell "/bin/bash"
  supports :manage_home => true
  :create 
end
