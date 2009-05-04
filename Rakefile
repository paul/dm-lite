require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "dm-lite"
    gem.summary = %Q{TODO}
    gem.email = "psadauskas@gmail.com"
    gem.homepage = "http://github.com/paul/dm-lite"
    gem.authors = ["Paul Sadauskas"]

    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

require 'spec/rake/spectask'
desc 'Run all specs'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_opts << '--options' << 'spec/spec.opts' if File.exists?('spec/spec.opts')
  t.libs << 'lib'
  t.spec_files = FileList['spec/**/*_spec.rb'] 
end

desc 'Default: Run Specs'
task :default => :spec

desc 'Run all tests'
task :test => :spec


task :default => :spec

