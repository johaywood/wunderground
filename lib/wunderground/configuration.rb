module Wunderground
  module Configuration
    VALID_CONNECTION_KEYS = [:domain, :user_agent, :method].freeze
    VALID_OPTIONS_KEYS    = [:api_key, :format].freeze
    VALID_CONFIG_KEYS     = VALID_CONNECTION_KEYS + VALID_OPTIONS_KEYS

    DEFAULT_DOMAIN      = "http://api.wunderground.com/".freeze
    DEFAULT_USER_AGENT  = "Wunderground Ruby Gem #{Wunderground::VERSION}".freeze
    DEFAULT_API_KEY     = "default_api_key"

    DEFAULT_METHOD       = :get
    DEFAULT_FORMAT       = :json

    # Build accessor methods for every config option
    attr_accessor *VALID_CONFIG_KEYS

    # Make sure we have the default values set when we get 'extended'
    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def reset
      self.domain     = DEFAULT_DOMAIN
      self.method     = DEFAULT_METHOD
      self.user_agent = DEFAULT_USER_AGENT

      self.api_key    = DEFAULT_API_KEY
      self.format     = DEFAULT_FORMAT
    end

  end # Configuration
end # Wunderground
