require 'resque'

Resque.redis = {
  host: ENV['REDIS_PORT_6379_TCP_ADDR'],
  port: ENV['REDIS_PORT_6379_TCP_PORT']
}
