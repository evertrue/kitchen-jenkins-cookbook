source 'https://api.berkshelf.com'

metadata

cookbook 'jenkins', github: 'opscode-cookbooks/jenkins', ref: '3fd92a09b597b9a464bfec5a8b5d927b65bb0a27'
cookbook 'rbenv', github: 'fnichol/chef-rbenv', ref: '0a3018634bafe58ad21c6ee271af015220e444b9'

group :integration do
  cookbook 'apt'
end
