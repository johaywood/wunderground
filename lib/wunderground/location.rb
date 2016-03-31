module Wunderground
  class Location
    attr_accessor :state, :city, :country, :city, :zip, :airport, :lat, :long, :pws, :autoip

    def initialize(options = {})
      raise ArgumentError, "No Location Options Provided" if options.empty?
      options.each do |key, value|
        instance_variable_set("@#{key}".to_sym, value)
      end
    end

    def location
      if zip
        zip
      elsif state && city
        "#{state}/#{city.gsub(' ', '_')}"
      elsif country && city
        "#{country.gsub(' ', '_')}/#{city.gsub(' ', '_')}"
      elsif airport
        airport
      elsif lat && long
        "#{lat},#{long}"
      elsif pws
        "pws:#{pws}"
      elsif autoip
        "autoip"
      else
        raise ArgumentError, "Invalid Location Options"
      end
    end
  end
end
