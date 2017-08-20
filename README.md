# CodeClimate::Client - Code Climate API Ruby Client
[![Build Status](https://semaphoreci.com/api/v1/wnuqui/codeclimate-api-ruby-client/branches/master/badge.svg)](https://semaphoreci.com/wnuqui/codeclimate-api-ruby-client) <a href="https://codeclimate.com/github/wnuqui/codeclimate-api-ruby-client"><img src="https://codeclimate.com/github/wnuqui/codeclimate-api-ruby-client/badges/gpa.svg" /></a> <a href="https://codeclimate.com/github/wnuqui/codeclimate-api-ruby-client"><img src="https://codeclimate.com/github/wnuqui/codeclimate-api-ruby-client/badges/issue_count.svg" /></a> <a href="https://codeclimate.com/github/wnuqui/codeclimate-api-ruby-client/coverage"><img src="https://codeclimate.com/github/wnuqui/codeclimate-api-ruby-client/badges/coverage.svg" /></a>

Interface with Code Climate API via Ruby using this gem.

## TODOS

List of APIs to be implemented found [here](TODO.md)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'codeclimate-api-ruby-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codeclimate-api-ruby-client

## Usage

```ruby
require 'code_climate'

client = CodeClimate::Client.configure do |client|
  client.base_uri = 'https://api.codeclimate.com/v1/'
  client.api_token = 'abc40a334236eb8461afe1c041bed13097fab628'
end

client.repos.at('2e12027592e3170b11000199')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Do not forget to add local `.env` and put your `API_TOKEN=token` in it.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wnuqui/codeclimate-api-ruby-client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
