# Cinch::Plugins::Urbandict

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
