site :opscode

metadata

cookbook "jenkins", :git => "git://github.com/opscode-cookbooks/jenkins.git", :branch => "master"
cookbook "rbenv", :git => "git@github.com:fnichol/chef-rbenv.git", :branch => "master"

group :integration do
  cookbook "apt"
end
