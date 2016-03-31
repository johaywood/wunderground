module Wunderground
  module Resources

    RESOURCES = [
      :alerts, :almanac, :astronomy, :conditions,
      :currenthurricane, :forecast, :forecast10day, :geolookup,
      :history, :hourly, :hourly10day, :planner,
      :rawtide, :satellite, :tide, :webcams, :yesterday
    ]

    def self.method_missing(sym, options = {})
      location = Location.new(options).location
      raise NoMethodError unless RESOURCES.include?(sym)
      JSON.parse Client.get("api/#{Wunderground.api_key}/#{sym}/q/#{location}.json").body
    end
  end
end
