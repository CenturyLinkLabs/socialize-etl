require_relative 'config/resque'
require_relative 'lib/etl'
require 'resque/tasks'

namespace :socialize do
  desc 'Pull social items down'
  task :pull_and_save do
    Resque.enqueue(Etl)
  end
end
