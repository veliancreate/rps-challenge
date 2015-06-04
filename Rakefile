require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RuboCop::RakeTask.new(:cop)
RSpec::Core::RakeTask.new(:spec)

task default: [:cop, :spec]

task :console do
  require 'irb'
  require 'irb/completion'
  require_relative 'app/server'
  ARGV.clear
  IRB.start
end