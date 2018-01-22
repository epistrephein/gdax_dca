require 'bundler/setup'
require 'coinbase/exchange'
require 'logger'
require 'yaml'

require_relative 'patch/market_bid_ask'

# load configuration file
config = YAML.load_file(File.join(__dir__, 'config', 'config.yml'))

# initialize logger
logger = Logger.new($stdout)
logger.level = Logger::INFO

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
rescue Coinbase::Exchange::APIError => e
  if (tries -= 1).positive?
    sleep 300
    retry
  else
    # log error
    logger.error(e.class) { e.message }
    abort
  end
end

# log transaction
logger.info('NEW ORDER') { "id: #{transaction['id']}" }
