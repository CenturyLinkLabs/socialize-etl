require 'feedjira'
require 'faraday'

class Etl
  @queue = :etl

  GITHUB_FEED_URL = ENV['GITHUB_FEED_URL']
  API_URL = "http://#{ENV['API_PORT_3000_TCP_ADDR']}:#{ENV['API_PORT_3000_TCP_PORT']}"

  def self.perform
    self.new.do_work
  end

  def do_work
    feed = Feedjira::Feed.fetch_and_parse(GITHUB_FEED_URL)
    feed.entries.each do |entry|
      connection.post('/github_items', {
        github_item: {
          title: entry.title,
          content: entry.content
        }
      })
    end
  end

  private

  def connection
    @connection ||= Faraday.new(url: API_URL)
  end
end
