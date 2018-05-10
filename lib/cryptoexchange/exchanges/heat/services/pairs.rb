module Cryptoexchange::Exchanges
  module Heat
    module Services
      class Pairs < Cryptoexchange::Services::Pairs
        PAIRS_URL = "#{Cryptoexchange::Exchanges::Heat::Market::TICKER_URL}"

        def fetch
          output = super
          adapt(output)
        end

        def adapt(output)
          market_pairs = []
          output.each do |pair|

            market_pairs << Cryptoexchange::Models::MarketPair.new(
                              base: pair["assetProperties"] ? pair["assetProperties"].split(",")[0].delete("[").tr('"','') : "HEAT",
                              target: pair["currencyProperties"] ? pair["currencyProperties"].split(",")[0].delete("[").tr('"','') : "HEAT",
                              market: Heat::Market::NAME
                            )
          end

          market_pairs
        end
      end
    end
  end
end
