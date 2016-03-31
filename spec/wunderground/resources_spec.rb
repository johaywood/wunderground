require 'spec_helper'

describe Wunderground::Resources do
  describe 'available resource methods' do
    it 'provides methods for all legal resources' do
      Wunderground::Resources::RESOURCES.each do |resource|
        VCR.use_cassette("resource_#{resource}_get_spec") do
          response = Wunderground::Resources.public_send(resource, { zip: '10001' })
          expect(response).to be_a Hash
        end
      end
    end
  end

  describe 'non resource methods' do
    it 'raises a NoMethodError' do
      expect { Wunderground::Resources.foo(zip: '10001') }.to raise_error(NoMethodError)
    end
  end
end
