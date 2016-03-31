require 'json'
require 'net/http'

require_relative "wunderground/version"
require_relative "wunderground/configuration"
require_relative "wunderground/client"
require_relative "wunderground/resources"
require_relative "wunderground/location"

module Wunderground
  extend Configuration
end
