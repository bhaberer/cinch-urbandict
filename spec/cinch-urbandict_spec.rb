# -*- coding: utf-8 -*-
require 'spec_helper'

describe Cinch::Plugins::UrbanDict do
  include Cinch::Test

  before(:all) do
    @bot = make_bot(Cinch::Plugins::UrbanDict)
  end

  it 'should allow users to search for words' do
    get_replies(make_message(@bot, '!ud dork')).first.text.
      should match('Someone who has odd interests')
  end

  it 'should not return nil for valid searches' do
    get_replies(make_message(@bot, '!ud dork')).first.text.
      should_not be_nil
  end

  it 'should return an error for invalid searches' do
    get_replies(make_message(@bot, '!ud 7zJ6t8rT8p384My')).first.text.
      should == "test: Urban Dictionary ∴ 7zJ6t8rT8p384My: No definition available."
  end

  it 'should not return multiple lines for a definition with breaks' do
    response = get_replies(make_message(@bot, '!ud dong')).first.text
    response.should_not match("<br")
    response.should_not match("\r")
    response.should_not match("\n")
  end
end
