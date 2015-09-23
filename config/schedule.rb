set :environment, 'development', 'production'

every 1.minute do
  runner "TextWorker.send_text_to_all", output: '~/Desktop/test.log'
end
