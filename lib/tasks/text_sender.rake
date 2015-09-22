# require File.expand_path(File.dirname(__FILE__) + "/environment")
namespace :text_sender do
  task :send => :environment do
    number = Dreamer.first.phone_num
    TextWorker.perform_in(1.seconds, number)
  end
end
