require 'rake'
require 'aws-sdk'

Aws.config[:region] = 'ap-northeast-1'

Dir.glob('tasks/*.rake').each { |r| import r }

