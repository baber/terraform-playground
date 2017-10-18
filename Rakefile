
ENV['TF_LOG'] = 'INFO'
ENV['AWS_REGION'] = 'eu-west-2'

begin
  require 'rspec/core/rake_task'
  require 'rake/packagetask'

  task RSpec::Core::RakeTask.new(:unitTest) do |t|
    t.rspec_opts = "--tag unit"
  end

   task RSpec::Core::RakeTask.new(:intTest) do |t|
      t.rspec_opts = "--tag integration"
   end


   package_task = Rake::PackageTask.new('terraform-playground', '0.0.1-SNAPSHOT') do |p|
      p.need_tar = true
      p.package_dir = 'target'
      p.package_files.include("./configurations/**/*.tf")
    end

    task :default => [:unitTest, :intTest, :repackage]


rescue LoadError
  # no rspec available
end
