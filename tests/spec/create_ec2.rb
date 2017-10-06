require 'spec_helper'

describe ec2('baber-test-ec2') do
  its(:instance_id) { should eq 'i-06079c8f0ac5d9232' }
  it { should be_running }
  its(:image_id) { should eq 'ami-1a7f6d7e' }
  its(:public_ip_address) { should eq '35.177.29.221' }
  it { should have_security_group('default') }
  it { should belong_to_vpc('vpc-2d95d044') }
  it { should belong_to_subnet('subnet-f3bbcc88') }
end
