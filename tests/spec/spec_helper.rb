require 'awspec'
Awsecrets.load(secrets_path: File.expand_path('./secrets.yml', File.dirname(__FILE__)))

@instance_name = [*('A'..'Z')].sample(10).join

RSpec.configure do |config|
  config.add_setting :instance_name
  config.instance_name = @instance_name
  config.before(:all) { @instance_name = config.instance_name }
end
