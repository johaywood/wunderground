module Wunderground
  class Client

    def self.get(url, *options)
      uri = URI(Wunderground.domain + url)
      Net::HTTP.get_response(uri)
    end
  end # Client
end # Wunderground
