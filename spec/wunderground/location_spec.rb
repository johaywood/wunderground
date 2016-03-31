require 'spec_helper'

describe Wunderground::Location do
  context "with valid location options" do
    context "with zip code" do
      it "returns the zip code" do
        location = Wunderground::Location.new(zip: "10001")
        expect(location.location).to eq "10001"
      end
    end

    context "with city and state" do
      it "returns the city and state" do
        location = Wunderground::Location.new(state: "NY", city: "New York")
        expect(location.location).to eq "NY/New_York"
      end
    end

    context "with city and country" do
      it "returns the city and country" do
        location = Wunderground::Location.new(country: "England", city: "London")
        expect(location.location).to eq "England/London"
      end
    end

    context "with airport code" do
      it "returns the airport code" do
        location = Wunderground::Location.new(airport: "LGA")
        expect(location.location).to eq "LGA"
      end
    end

    context "with latitude and longitude" do
      it "returns the latitude and longitude code" do
        location = Wunderground::Location.new(lat: "40.748817", long: "-73.985428")
        expect(location.location).to eq "40.748817,-73.985428"
      end
    end

    context "with private weather station code" do
      it "returns the pws code" do
        location = Wunderground::Location.new(pws: "B29D31")
        expect(location.location).to eq "pws:B29D31"
      end
    end

    context "with autoip set to true" do
      it "returns autoip" do
        location = Wunderground::Location.new(autoip: true)
        expect(location.location).to eq "autoip"
      end
    end
  end

  context "with invalid options" do
    it "raises an argument error" do
      expect { Wunderground::Location.new(state: "NY").location }.to raise_error(ArgumentError)
    end
  end

  context "with no location options" do
    it "raises an argument error" do
      expect { Wunderground::Location.new() }.to raise_error(ArgumentError)
    end
  end
end
