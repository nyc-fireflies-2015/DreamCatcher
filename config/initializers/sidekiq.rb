Sidekiq.configure_server do |config|
  config.redis = { url: "redis://redistogo:4246ff61c9921280a10349c647378277@tetra.redistogo.com:9967/" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://redistogo:4246ff61c9921280a10349c647378277@tetra.redistogo.com:9967/" }
end
