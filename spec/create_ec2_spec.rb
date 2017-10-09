require 'spec_helper'


describe ec2("#{@instance_name}") do

  before(:all) do |example|
  puts

  command = Thread.new do
    system("terraform","init", "-var", "instance_name=#{@instance_name}", "configurations/ec2")
    system("terraform", "apply", "-var", "instance_name=#{@instance_name}", "configurations/ec2")
  end
  command.join

  end


  it { should be_running }
  it { should have_tag('Name').value("#{@instance_name}") }
  its(:image_id) { should eq 'ami-1a7f6d7e' }
  its(:instance_type) { should eq 't2.nano' }

  after(:all) do
    command = Thread.new do
      system("terraform", "destroy", "-var", "instance_name=#{@instance_name}", "-force", "configurations/ec2")
    end
    command.join
  end

end
