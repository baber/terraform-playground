require 'awspec'


describe security_group("allow_whitelisted_ssh"), :unit do

  before(:all) do

    ENV['AWS_PROFILE'] = 'terraform'
    ENV['AWS_REGION'] = 'eu-west-2'

    `terraform init /Users/baberkhalil/software/projects/EqualExperts/HMRC/workspace/terraform-playground/configurations/security-groups`
    `terraform apply /Users/baberkhalil/software/projects/EqualExperts/HMRC/workspace/terraform-playground/configurations/security-groups`
  end


  it { should exist }
  it { be_inbound_opened_only }
  its(:inbound_rule_count) { should eq 1 }
  its(:inbound) { should be_opened(22).protocol('tcp') }

  after(:all) do

    `terraform destroy -force /Users/baberkhalil/software/projects/EqualExperts/HMRC/workspace/terraform-playground/configurations/security-groups`
  end

end
