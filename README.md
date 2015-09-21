# godaddy-api

[![Dependency Status](https://gemnasium.com/blueicefield/ruby-godaddy-api.svg)](https://gemnasium.com/blueicefield/ruby-godaddy-api)
[![Code Climate](https://codeclimate.com/github/blueicefield/ruby-godaddy-api/badges/gpa.svg)](https://codeclimate.com/github/blueicefield/ruby-godaddy-api)

## Description

A very minimalist library to interact with the GoDaddy API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'godaddy-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install godaddy-api

## Usage

First, you will need to generate your API keys from [this page](https://sso.godaddy.com/login?realm=idp&app=developer&path=%2Fkeys%2F).

```ruby
require 'godaddy/api'

api = Godaddy::Api.new apikey, apisecret

result = api.get('/v1/domains')

puts result
=>
[
  {
    "domainId": 11111111,
    "domain": "mydomain.com",
    "status": "ACTIVE",
    "expires": "2016-09-14T21:59:59Z",
    "expirationProtected": false,
    "holdRegistrar": false,
    "limited": false,
    "locked": true,
    "privacy": false,
    "renewAuto": true,
    "smart": false,
    "transferProtected": false
  }
]

result = api.patch('/v1/domains/mydomain.com/records',
                    [{ type: 'A', name: 'test', data: '1.2.3.4', ttl: 60 }]
                  )

puts result
=>
{}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/blueicefield/ruby-godaddy-api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

