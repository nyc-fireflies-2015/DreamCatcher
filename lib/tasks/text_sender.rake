namespace :text_sender do
  task :send => :environment do
    @subscribed.each do |dreamer|
      number = dreamer.phone_num
      TextWorker.perform_at(5.seconds, number)
    end
  end

end
