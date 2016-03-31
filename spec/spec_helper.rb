$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'wunderground'
require 'rspec'
require 'vcr'
require 'webmock'

#VCR config
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/wunderground_cassettes'
  c.hook_into :webmock
end
