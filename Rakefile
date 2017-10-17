
ENV['TF_LOG'] = 'INFO'
ENV['AWS_REGION'] = 'eu-west-2'

begin
  require 'rspec/core/rake_task'

  task RSpec::Core::RakeTask.new(:unitTest) do |t|
    t.rspec_opts = "--tag unit"
  end

   task RSpec::Core::RakeTask.new(:intTest) => :unitTest do |t|
      t.rspec_opts = "--tag integration"
    end

  task :default => :intTest

rescue LoadError
  # no rspec available
end
