require 'spec_helper'

describe Wunderground::Client do

  describe '#get' do
    it 'returns a Net::HTTPResponse' do
      VCR.use_cassette("client_get_spec") do
        response = Wunderground::Client.get("api/#{Wunderground.api_key}/conditions/q/10001.json")
        expect(response).to be_a(Net::HTTPOK)
      end
    end
  end
end
