require 'awspec'


describe security_group("allow_whitelisted_ssh"), :unit do

  before(:all) do

    ENV['AWS_PROFILE'] = 'terraform'
    ENV['AWS_REGION'] = 'eu-west-2'

    `terraform init ./configurations/security-groups`
    `terraform apply ./configurations/security-groups`
  end


  it { should exist }
  it { be_inbound_opened_only }
  its(:inbound_rule_count) { should eq 1 }
  its(:inbound) { should be_opened(22).protocol('tcp') }

  after(:all) do

    `terraform destroy -force ./configurations/security-groups`
  end

end
