
ENV['AWS_PROFILE'] = 'terraform'
ENV['TF_LOG'] = 'DEBUG'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')
task :default => :spec
