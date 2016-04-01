require 'spec_helper'

describe Wunderground::Resources do
  describe 'available resource methods' do
    it 'provides methods for all legal resources' do
      Wunderground::Resources::RESOURCES.each do |resource|
        VCR.use_cassette("resource_#{resource}_get_spec") do
          response = Wunderground::Resources.public_send(resource, { zip: '10001' })
          expect(response).to be_a Hash
          expect(response['response']['features']).to have_key resource.to_s
        end
      end
    end

    it 'allows for chaining of methods with _and_' do
      VCR.use_cassette("resource_geolookup_forecast_get_spec") do
        response = Wunderground::Resources.geolookup_and_forecast(zip: '10001')
        expect(response).to be_a Hash
        expect(response['response']['features']).to have_key 'geolookup'
        expect(response['response']['features']).to have_key 'forecast'
      end
    end
  end

  describe 'non resource methods' do
    it 'raises a NoMethodError for single endpoint' do
      expect { Wunderground::Resources.foo(zip: '10001') }.to raise_error(NoMethodError)
    end

    it 'raises a NoMethodError if one of multi endpoint call invalid' do
      expect { Wunderground::Resources.forecast_and_foo(zip: '10001') }.to raise_error(NoMethodError)
    end
  end
end
