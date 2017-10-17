require 'awspec'

@instance_name = [*('A'..'Z')].sample(10).join

RSpec.configure do |config|
  config.add_setting :instance_name
  config.add_setting :security_group

  config.instance_name = @instance_name
  config.security_group = "allow_whitelisted_ssh"
  config.before(:all) {
        @instance_name = config.instance_name
  }
end
