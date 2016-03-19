describe 'configuration' do

  context 'with default options' do
    describe '.api_key' do
      it 'should return default key' do
        expect(Wunderground.api_key).to eq Wunderground::Configuration::DEFAULT_API_KEY
      end
    end

    describe '.format' do
      it 'should return default format' do
        expect(Wunderground.format).to eq Wunderground::Configuration::DEFAULT_FORMAT
      end
    end

    describe '.user_agent' do
      it 'should return default user agent' do
        expect(Wunderground.user_agent).to eq Wunderground::Configuration::DEFAULT_USER_AGENT
      end
    end

    describe '.method' do
      it 'should return default http method' do
        expect(Wunderground.method).to eq Wunderground::Configuration::DEFAULT_METHOD
      end
    end
  end

  context 'with user configured options' do

    before(:each) do
      Wunderground.configure do |c|
        c.api_key = 'user_configured_key'
        c.format = :user_configured_format
        c.user_agent = 'user_configured_user_agent'
        c.method = :user_configured_method
      end
    end

    describe '.api_key' do
      it 'should return configured key' do
        expect(Wunderground.api_key).to eq 'user_configured_key'
      end
    end

    describe '.format' do
      it 'should return configured format' do
        expect(Wunderground.format).to eq :user_configured_format
      end
    end

    describe '.user_agent' do
      it 'should return configured user agent' do
        expect(Wunderground.user_agent).to eq 'user_configured_user_agent'
      end
    end

    describe '.method' do
      it 'should return configured http method' do
        expect(Wunderground.method).to eq :user_configured_method
      end
    end

    describe '.reset' do
      it 'resets the config values to default' do
        Wunderground.reset
        expect(Wunderground.api_key).to eq Wunderground::Configuration::DEFAULT_API_KEY
        expect(Wunderground.format).to eq Wunderground::Configuration::DEFAULT_FORMAT
        expect(Wunderground.user_agent).to eq Wunderground::Configuration::DEFAULT_USER_AGENT
        expect(Wunderground.method).to eq Wunderground::Configuration::DEFAULT_METHOD
      end
    end
  end
end
