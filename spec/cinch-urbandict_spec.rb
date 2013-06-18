# -*- coding: utf-8 -*-
require 'spec_helper'

describe Cinch::Plugins::UrbanDict do

  before(:all) do
    @plugin = Cinch::Plugins::UrbanDict.new
  end

  it 'should allow users to search for words' do
    @plugin.send(:get_def, 'dork').
      should match('Someone who has odd interests')
  end

  it 'should not return nil for valid searches' do
    @plugin.send(:get_def, 'dong').
      should_not be_nil
  end

  it 'should return an error for invalid searches' do
    @plugin.send(:get_def, '7zJ6t8rT8p384My').
      should == "Urban Dictionary ∴ 7zJ6t8rT8p384My: No definition available."
  end

  it 'should not eturn multiple lines for a definition with breaks' do
    @plugin.send(:get_def, 'dong').
      should_not match("\n")
  end
end
