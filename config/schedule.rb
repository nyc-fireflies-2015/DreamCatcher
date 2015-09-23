# set :environment, 'production'

every 2.minutes do
  runner "TextWorker.send_text_to_all", output: './log/cron.log'
end
