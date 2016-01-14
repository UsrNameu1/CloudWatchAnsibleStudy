require 'rake'
require 'aws-sdk'

desc "provision servers"
task :provision do
  ssh_key_path = ENV['SSH_KEY_PATH']
  sh "ansible-playbook -i ansible/inventory/hosts ansible/site.yml --private-key=#{ssh_key_path} -u ec2-user -e hosts=web"
end
