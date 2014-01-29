# -*- coding: utf-8 -*-
require 'cinch'
require 'cinch/cooldown'
require 'cinch/toolbox'

module Cinch::Plugins
  # Cinch plugin for getting UD defs.
  class UrbanDict
    include Cinch::Plugin

    enforce_cooldown

    self.help = 'Use .ud <term> to see the Urban Dictionary definition.'

    match /ud (.*)/

    def execute(m, term)
      m.reply get_def(term), true
    end

    private

    def get_def(term)
      # URI Encode
      term = URI.escape(term, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))

      # Check if it's not defined.
      if Cinch::Toolbox.get_html_element(ud_url(term), '#not_defined_yet')
        return "Urban Dictionary ∴ #{term}: No definition available."
      end

      # Get the def
      ud_def(term)
    end

    def ud_def(term)
      # Grab the element
      result = Cinch::Toolbox.get_html_element(ud_url(term), '.meaning')

      result.gsub!(/[\n\r]/, ' - ')

      # Make sure it's not terribly long
      result = Cinch::Toolbox.truncate(result, 250)
      url = Cinch::Toolbox.shorten(ud_url(term))

      debug result
      "Urban Dictionary ∴ #{term}: #{result} [#{url}]"
    end

    def ud_url(term)
      "http://www.urbandictionary.com/define.php?term=#{term}"
    end
  end
end
