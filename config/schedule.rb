# set :environment, 'production'

every 5.minute do
  runner "TextWorker.send_text_to_all", output: './log/cron.log'
end
