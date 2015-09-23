set :environment, 'development'

every 1.minute do
  runner "TextWorker.send_text_to_all"
end

