# spec/my_class_spec.rb

require 'rspec_helper'

RSpec.describe FaradaySample do
  describe '#request' do
    let(:net_http) { instance_spy(Faraday::Adapter::NetHttp)}

    before do
      allow(Faraday::Adapter::NetHttp).to receive(:new).and_return(net_http)
      env = Faraday::Env.new()
      env[:status] = 500
      allow(net_http).to receive(:call).and_return(env)
    end

    it 'retries the request 3 times on timeout error' do
      described_class.new.request
      expect(net_http).to have_received(:call).exactly(4).times
    end
  end
end