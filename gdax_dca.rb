require 'bundler/setup'
require 'coinbase/exchange'
require 'yaml'

require_relative 'patch/market_bid_ask'

# load configuration file
config = YAML.load_file(File.join(__dir__, 'config', 'config.yml'))

# initialize API client
client = Coinbase::Exchange::Client.new(
  config[:auth][:api_key],
  config[:auth][:api_secret],
  config[:auth][:api_pass],
  product_id: config[:buy][:market]
)

# begin transaction
begin
  tries ||= 5
  transaction = client.buy_market(config[:buy][:daily])
rescue Coinbase::Exchange::APIError
  sleep 300
  (tries -= 1) > 0 ? retry : abort('API error')
end

puts "[#{transaction['created_at']}] #{transaction['id']}"
