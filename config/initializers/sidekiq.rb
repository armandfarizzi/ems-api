Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://localhost:6379/0', password: "authentication"}
end

Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://localhost:6379/0', password: "authentication"}
end