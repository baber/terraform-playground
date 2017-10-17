require 'awspec'


describe security_group("allow_whitelisted_ssh"), :unit do

  before(:all) do

  command = Thread.new do
    system("terraform","init", "configurations/security-groups")
    system("terraform", "apply", "configurations/security-groups")
  end
  command.join

  end


  it { should exist }
  it { be_inbound_opened_only }
  its(:inbound_rule_count) { should eq 1 }
  its(:inbound) { should be_opened(22).protocol('tcp') }

  after(:all) do
    command = Thread.new do
      system("terraform", "destroy", "-force", "configurations/security-groups")
    end
    command.join
  end

end
