# -*- coding: utf-8 -*-
require 'cinch'
require 'cinch-cooldown'
require 'cinch-toolbox'

module Cinch::Plugins
  class UrbanDict
    include Cinch::Plugin

    enforce_cooldown

    self.help = "Use .ud <term> to see the Urban Dictionary definition for that term."

    match /ud (.*)/

    def execute(m, term)
      m.reply get_def(term)
    end

    private

    def get_def(term)
      # URI Encode
      term = URI.escape(term, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))

      url = "http://www.urbandictionary.com/define.php?term=#{term}"

      # Grab the element
      result = Cinch::Toolbox.get_html_element(url, '.definition')

      #Make sure it's not terribly long
      result = Cinch::Toolbox.truncate(result, 250)

      return "Urban Dictionary ∴ #{term}: #{result} [#{Cinch::Toolbox.shorten(url)}]"
    rescue NoMethodError
      debug "Caught a NoMethodError looking up #{term}"
      return "Sorry I couldn't find that term."
    end
  end
end
