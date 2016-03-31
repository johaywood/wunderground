# Wunderground

Weather Underground API Wrapper. Curretly includes support for all data features.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wunderground', git: 'https://github.com/johaywood/wunderground.git'
```

And then execute:

    $ bundle

## Usage

You will need a Wunderground API Key available [here](https://www.wunderground.com/weather/api/).

Configure your Wunderground to use the API key you receive.
```ruby
Wunderground.configure do |config|
  config.api_key = ENV['WUNDERGROUND_API_KEY']
end
```

### Data Objects

Available data objects are alerts, **almanac**, **astronomy**, **conditions**, **currenthurricane**, **forecast**, **forecast10day**, **geolookup**, **history**, **hourly**, **hourly10day**, **planner**, **rawtide**, **satellite**, **tide**, **webcams**, and **yesterday**. More information about each of these data objects can be found in the [Wunderground API documentation](https://www.wunderground.com/weather/api/d/docs).

To make a call for a data object where the arguments passed are the location parameters:

```ruby
Wunderground::Resources.almanac(zip: '10001')
Wunderground::Resources.conditions(city: 'New York', state: 'NY')
Wunderground::Resources.hourly10day(city: 'London', state: 'England')
etc...
```

This will return a hash of the response body for the location provided. The schemas for the response objects can be found in the Wunderground documentation.

### Locations

There are several ways to provide the location for the data object you wish to retrieve:
- Zip Code `(zip: '10001')`
- US City/State `(city: 'New York', state: 'NY')`
- International City/Country `(city: 'London', country: 'England')`
- Airport Code `(airport: 'LGA')`
- Latitude/Longitude `(lat: '40.748817', long: '-73.985428')`
- Private Weather Station Code `(pws: B12E942)`
- AutoIP Detection `(autoip: true)`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/johaywood/wunderground.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

