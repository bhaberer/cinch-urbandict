# Cinch::Plugins::Urbandict

[![Gem Version](https://badge.fury.io/rb/cinch-urbandict.png)](http://badge.fury.io/rb/cinch-urbandict)
[![Dependency Status](https://gemnasium.com/bhaberer/cinch-urbandict.png)](https://gemnasium.com/bhaberer/cinch-urbandict)
[![Build Status](https://travis-ci.org/bhaberer/cinch-urbandict.png?branch=master)](https://travis-ci.org/bhaberer/cinch-urbandict)
[![Coverage Status](https://coveralls.io/repos/bhaberer/cinch-urbandict/badge.png?branch=master)](https://coveralls.io/r/bhaberer/cinch-urbandict?branch=master)
[![Code Climate](https://codeclimate.com/github/bhaberer/cinch-urbandict.png)](https://codeclimate.com/github/bhaberer/cinch-urbandict)

Simple Cinch Plugin to fetch Urbandictionary defs.

## Installation

Add this line to your application's Gemfile:

    gem 'cinch-urbandict'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cinch-urbandict

## Usage

Just add the plugin to your list:

    @bot = Cinch::Bot.new do
      configure do |c|
        c.plugins.plugins = [Cinch::Plugins::UrbanDict]
      end
    end

Then in channel use:

    .ud kitten

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
