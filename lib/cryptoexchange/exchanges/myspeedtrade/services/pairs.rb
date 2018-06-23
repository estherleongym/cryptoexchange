module Cryptoexchange::Exchanges
  module Myspeedtrade
    module Services
      class Pairs < Cryptoexchange::Services::Pairs
        PAIRS_URL = "#{Cryptoexchange::Exchanges::Myspeedtrade::Market::API_URL}/markets"
require 'byebug'
        def fetch
          byebug
          output = super
          market_pairs = []
          output.each do |pair|
            base, target = pair['name'].split('/')
            market_pairs << Cryptoexchange::Models::MarketPair.new(
                              base: base,
                              target: target,
                              market: Myspeedtrade::Market::NAME
                            )
          end
          market_pairs
        end
      end
    end
  end
end
