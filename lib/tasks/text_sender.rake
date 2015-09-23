# require File.expand_path(File.dirname(__FILE__) + "/environment")
namespace :text_sender do
  task :send => :environment do
    TextWorker.send_text_to_all
  end
end
