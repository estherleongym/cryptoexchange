require 'spec_helper'

RSpec.describe 'P2pb2b integration specs' do
  client = Cryptoexchange::Client.new
  let(:eth_btc_pair) { Cryptoexchange::Models::MarketPair.new(base: 'ETH', target: 'BTC', market: 'p2pb2b') }

  it 'fetch pairs' do
    pairs = client.pairs('p2pb2b')
    expect(pairs).not_to be_empty

    pair = pairs.first
    expect(pair.base).to_not be nil
    expect(pair.target).to_not be nil
    expect(pair.market).to eq 'p2pb2b'
  end

  it 'fetch ticker' do
    ticker = client.ticker(eth_btc_pair)

    expect(ticker.base).to eq 'ETH'
    expect(ticker.target).to eq 'BTC'
    expect(ticker.market).to eq 'p2pb2b'
    expect(ticker.bid).to be_a Numeric
    expect(ticker.ask).to be_a Numeric
    expect(ticker.last).to be_a Numeric
    expect(ticker.high).to be_a Numeric
    expect(ticker.low).to be_a Numeric
    expect(ticker.volume).to be_a Numeric
    expect(ticker.change).to be_a Numeric
    expect(ticker.payload).to_not be nil
  end
end
