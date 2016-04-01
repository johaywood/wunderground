module Wunderground
  module Resources

    RESOURCES = [
      :alerts, :almanac, :astronomy, :conditions,
      :currenthurricane, :forecast, :forecast10day, :geolookup,
      :history, :hourly, :hourly10day, :planner,
      :rawtide, :satellite, :tide, :webcams, :yesterday
    ]

    def self.method_missing(sym, options = {})
      queries = sym.to_s.split("_and_").map(&:to_sym)
      location = Location.new(options).location
      raise NoMethodError unless (queries - RESOURCES).empty?
      JSON.parse Client.get("api/#{Wunderground.api_key}/#{queries.join("/")}/q/#{location}.json").body
    end
  end
end
