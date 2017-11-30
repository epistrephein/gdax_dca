module Coinbase
  module Exchange
    class APIClient
      def bid_market(funds, params = {})
        params[:product_id] ||= @default_product
        params[:funds] = funds
        params[:side] = 'buy'
        params[:type] = 'market'

        out = nil
        post('/orders', params) do |resp|
          out = response_object(resp)
          yield(out, resp) if block_given?
        end
        out
      end
      alias buy_market bid_market

      def ask_market(size, params = {})
        params[:product_id] ||= @default_product
        params[:size] = size
        params[:side] = 'sell'
        params[:type] = 'market'

        out = nil
        post('/orders', params) do |resp|
          out = response_object(resp)
          yield(out, resp) if block_given?
        end
        out
      end
      alias sell_market ask_market
    end
  end
end
