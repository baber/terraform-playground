require 'ec2/spec_helper'


describe ec2("#{@instance_name}"), :integration do

  before(:all) do
    ENV['AWS_PROFILE'] = 'terraform'
    ENV['AWS_REGION'] = 'eu-west-2'

  command = Thread.new do
    `terraform init -var instance_name=#{@instance_name} -var security_group=#{RSpec.configuration.security_group} ./configurations`
    `terraform apply -var instance_name=#{@instance_name} -var security_group=#{RSpec.configuration.security_group} ./configurations`
  end
  command.join

  end


  it { should be_running }
  it { should have_tag('Name').value("#{@instance_name}") }
  its(:image_id) { should eq 'ami-1a7f6d7e' }
  its(:instance_type) { should eq 't2.nano' }

  it { should have_security_groups(["#{RSpec.configuration.security_group}"]) }

  after(:all) do
    `terraform destroy -force -var instance_name=#{@instance_name} -var security_group=#{RSpec.configuration.security_group} ./configurations`
  end

end
