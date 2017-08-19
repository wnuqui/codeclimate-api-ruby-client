require 'simplecov'
SimpleCov.start

require 'byebug'
require 'vcr'
require 'smart_rspec'

require 'bundler/setup'
require 'code_climate'

require 'dotenv/load'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include SmartRspec
end

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.cassette_library_dir = 'fixtures/vcr_cassettes'
  config.hook_into :webmock

  config.filter_sensitive_data('Token token=TOKEN') do |interaction|
    interaction.request.headers['Authorization'].first
  end
end

CodeClimate::Client.configure do |client|
  client.base_uri = 'https://api.codeclimate.com/v1/'
  client.api_token = ENV['API_TOKEN']
end
