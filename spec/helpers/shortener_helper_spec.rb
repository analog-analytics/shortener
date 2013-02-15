# -*- coding: utf-8 -*-
require 'spec_helper'

describe Shortener::ShortenerHelper do
  before { @short_url = Shortener::ShortenedUrl.generate("www.doorkeeperhq.com") }

  describe "short_url" do
    it "should shorten the url" do
      helper.short_url("www.doorkeeperhq.com").should == "http://test.host/#{@short_url.unique_key}"
    end

    it "should allow setting the url host" do
      helper.short_url("www.doorkeeperhq.com", nil, :host => "customhost.com").should == "http://customhost.com/#{@short_url.unique_key}"
    end
  end
end
